#include <iostream>
#include <chrono>
#include "lodepng.h"
#include "lodepng.cpp"
#include "processing.h"

using namespace std;
using namespace lodepng;
using namespace chrono;

int main(int argc, char** argv) {
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
