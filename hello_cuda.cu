#include <cuda_runtime.h>
#include <stdio.h>

__global__ void helloFromGPU() {
    printf("Hello World from GPU!\n");
}

int main() {
    printf("Hello World from CPU!\n");

    // Launch a kernel on the GPU with one thread.
    helloFromGPU<<<1, 1>>>();

    // Wait for GPU to finish before accessing on host
    cudaDeviceSynchronize();

    return 0;
}
