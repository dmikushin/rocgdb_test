#include <hip/hip_runtime.h>

__global__ void kernel(int* i)
{
	(*i)++;
#if 0
	// Test device printf:
	// https://github.com/ROCm-Developer-Tools/HIP/issues/3161
	printf("Hello, world!\n");
#endif
}

int main(int argc, char* argv[])
{
	int deviceId;
	hipGetDevice(&deviceId);
	hipDeviceProp_t prop;
	hipGetDeviceProperties(&prop, deviceId);
	printf("Using %s\n", prop.name);
	int* val;
	hipMalloc(&val, sizeof(int));
	hipMemcpy(val, &argc, sizeof(int), hipMemcpyHostToDevice);
	kernel<<<dim3(1), dim3(1)>>>(val);
	hipDeviceSynchronize();
	hipMemcpy(&argc, val, sizeof(int), hipMemcpyDeviceToHost);
	printf("result = %d\n", argc);
	return 0;
}
