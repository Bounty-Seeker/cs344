
#include "cuda_runtime.h"
#include "device_launch_parameters.h"

#include <stdio.h>

#define NUM_BLOCKS 32
#define BLOCK_WIDTH 1

__global__ void hello()
{
	printf("Hello world! I'm a thread in block %d\n", blockIdx.x);
}


int main(int argc, char **argv)
{
	// launch the kernel
	hello <<<NUM_BLOCKS, BLOCK_WIDTH >>>();

	// force the printf()s to flush
	cudaDeviceSynchronize();

	printf("That's all!\n");

	// cudaDeviceReset must be called before exiting in order for profiling and
	// tracing tools such as Nsight and Visual Profiler to show complete traces.
	cudaDeviceReset();
	
	getchar();

	return 0;
}