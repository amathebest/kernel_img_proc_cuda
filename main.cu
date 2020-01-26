#include <iostream>
#include <chrono>
#include "lodepng.h"
#include "lodepng.cpp"
#include "utils.h"

using namespace std;
using namespace lodepng;
using namespace chrono;


__global__ void kernel_proc(unsigned char* input_image, unsigned char* output_image, int width, int height) {
    const unsigned int pixel_idx = blockIdx.x * blockDim.x + threadIdx.x;
    int x = pixel_idx % width;
    int y = (pixel_idx-x)/width;
    int filter_size = 1; // Size of the filter goes from -1 to 1
    // Checking if the index is within the image borders
    if (pixel_idx < width*height) {
        float output_red = 0;
        float output_green = 0;
        float output_blue = 0;
        int hits = 0;
        for (int ox = -filter_size; ox < filter_size+1; ++ox) {
            for (int oy = -filter_size; oy < filter_size+1; ++oy) {
                if ((x+ox) > -1 && (x+ox) < width && (y+oy) > -1 && (y+oy) < height) {
                    const int currentoffset = (pixel_idx+ox+oy*width)*3;
                    output_red += input_image[currentoffset];
                    output_green += input_image[currentoffset+1];
                    output_blue += input_image[currentoffset+2];
                    hits++;
                }
            }
        }
        output_image[pixel_idx*3] = output_red/hits;
        output_image[pixel_idx*3+1] = output_green/hits;
        output_image[pixel_idx*3+2] = output_blue/hits;
    }
}

void filter (unsigned char* input_image, unsigned char* output_image, int width, int height) {

    unsigned char* dev_input;
    unsigned char* dev_output;

    cudaMalloc((void**) &dev_input, width*height*3*sizeof(unsigned char));
    cudaMemcpy(dev_input, input_image, width*height*3*sizeof(unsigned char), cudaMemcpyHostToDevice);
    cudaMalloc((void**) &dev_output, width*height*3*sizeof(unsigned char));

    printf("Processing the image..\n");
    steady_clock::time_point time_1 = steady_clock::now();

    dim3 blockDims(512, 1, 1);
    dim3 gridDims((unsigned int) ceil((double)(width*height*3/blockDims.x)), 1, 1 );
    kernel_proc<<<gridDims, blockDims>>>(dev_input, dev_output, width, height);

    steady_clock::time_point time_2 = steady_clock::now();
    printf("Time elapsed: %Idns\n", duration_cast<nanoseconds>(time_2 - time_1).count());

    cudaMemcpy(output_image, dev_output, width*height*3*sizeof(unsigned char), cudaMemcpyDeviceToHost);

    cudaFree(dev_input);
    cudaFree(dev_output);
}

int main() {
    // Base path for input and output folders
    string base_path = "C:\\Users\\Matteo\\Dropbox\\University\\11\\PC\\kernel_img_proc_cuda";
    string input_folder = base_path + "\\input\\";
    string output_folder = base_path + "\\output\\";
    string file_name = "pic.png";
    string file_in = input_folder + file_name;
    string file_out = output_folder + file_name;

    // Image declaration and reading
    vector<unsigned char> img;
    unsigned int width, height;
    unsigned error = decode(img, width, height, file_in);

    unsigned char* input_image = new unsigned char[(img.size()*3)/4];
    unsigned char* output_image = new unsigned char[(img.size()*3)/4];

    int pixel_idx = 0;
    for (int i = 0; i < img.size(); ++i) {
        if ((i+1) % 4 != 0) { // Skipping transparency
            input_image[pixel_idx] = img.at(i);
            output_image[pixel_idx] = 255;
            pixel_idx++;
        }
    }

    // Applying blur effect
    filter(input_image, output_image, width, height);

    // Prepare data for output
    vector<unsigned char> out_image;
    for (int i = 0; i < img.size(); ++i) {
        out_image.push_back(output_image[i]);
        if ((i+1) % 3 == 0) { // Re-applying transparency
            out_image.push_back(255);
        }
    }

    // Picture output
    error = encode(file_out, out_image, width, height);

    return 0;
}
