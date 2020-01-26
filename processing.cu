//
// Created by Matteo on 25/01/2020.
//

#include <iostream>
#include <chrono>
#include "processing.h"

using namespace std;
using namespace chrono;

// Kernel CUDA function that processes the pixel identified by the expression <blockIdx.x * blockDim.x + threadIdx.x>.
// This process uses a 3x3 kernel matrix composed by 1/9 as kernel values.
// This applies a soft blur to the image.
__global__ void kernel_proc(unsigned char* input_image, unsigned char* output_image, int width, int height) {
    const unsigned int pixel_idx = blockIdx.x * blockDim.x + threadIdx.x; // Pixel index
    int filter_size = 1; // This is set to 1 in order to loop from -filter_size to +filter_size

    // X and Y coordinates of the pixel
    int x = pixel_idx % width;
    int y = (pixel_idx-x) / width;

    // Checking if the index is within the image borders
    if (pixel_idx < width*height) {
        // Accumulators for the kernel processing.
        // Each variable keeps the accumulated value for the multiplication with the original band value by the corresponding value in the kernel.
        float red_acc = 0;
        float green_acc = 0;
        float output_blue = 0;
        // n keeps track of how many multiplications occurs for the current pixel:
        // 3 on the vertices (0,0; 0,img.width; img.height,0; img.height,img.width), 6 on the edges and 9 for the rest of the image.
        int n = 0;
        for (int ox = -filter_size; ox < filter_size+1; ++ox) {
            for (int oy = -filter_size; oy < filter_size+1; ++oy) {
                if ((x+ox) > -1 && (x+ox) < width && (y+oy) > -1 && (y+oy) < height) { // Checks image boundaries
                    // Looping on kernel values and storing the accumulator values for the 3 bands
                    const int current_idx = (pixel_idx + ox + oy * width)*3;
                    red_acc += input_image[current_idx];
                    green_acc += input_image[current_idx + 1];
                    output_blue += input_image[current_idx + 2];
                    n++;
                }
            }
        }
        output_image[pixel_idx*3] = red_acc/n;
        output_image[pixel_idx*3+1] = green_acc/n;
        output_image[pixel_idx*3+2] = output_blue/n;
    }
}

void filter (unsigned char* input_image, unsigned char* output_image, int width, int height) {

    unsigned char* dev_input;
    unsigned char* dev_output;

    cudaMalloc((void**) &dev_input, width*height*3*sizeof(unsigned char));
    cudaMemcpy(dev_input, input_image, width*height*3*sizeof(unsigned char), cudaMemcpyHostToDevice);
    cudaMalloc((void**) &dev_output, width*height*3*sizeof(unsigned char));

    printf("Processing the image..\n");
    chrono::steady_clock::time_point time_1 = chrono::steady_clock::now();

    dim3 blockDims(512, 1, 1);
    dim3 gridDims((unsigned int) ceil((double)(width*height*3/blockDims.x)), 1, 1 );
    kernel_proc<<<gridDims, blockDims>>>(dev_input, dev_output, width, height);

    chrono::steady_clock::time_point time_2 = steady_clock::now();
    printf("Time elapsed: %Idns\n", chrono::duration_cast<nanoseconds>(time_2 - time_1).count());

    cudaMemcpy(output_image, dev_output, width*height*3*sizeof(unsigned char), cudaMemcpyDeviceToHost);

    cudaFree(dev_input);
    cudaFree(dev_output);
}