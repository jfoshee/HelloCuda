#include <cuda_runtime.h>
#include <stdio.h>

__global__ void helloFromGPU()
{
    printf("Hello World from GPU!\n");
}

int main()
{
    printf("Hello World from CPU!\n");

    cudaDeviceProp prop;
    const int device = 0;
    cudaGetDeviceProperties(&prop, device);
    printf("Device %d: %s\n", device, prop.name);
    printf("- Max threads per block: %d\n", prop.maxThreadsPerBlock);
    printf("- Max block dimensions: (%d, %d, %d)\n", prop.maxThreadsDim[0], prop.maxThreadsDim[1], prop.maxThreadsDim[2]);
    printf("- Max grid dimensions: (%d, %d, %d)\n", prop.maxGridSize[0], prop.maxGridSize[1], prop.maxGridSize[2]);

    // Launch a kernel on the GPU
    helloFromGPU<<<2, 2>>>();

    // Wait for GPU to finish before accessing on host
    cudaDeviceSynchronize();

    return 0;
}
