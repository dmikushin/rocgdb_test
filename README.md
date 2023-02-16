# rocgdb and device printf test case

This is for testing https://github.com/ROCm-Developer-Tools/HIP/issues/3161 and https://github.com/ROCm-Developer-Tools/HIP/issues/3162

## Testing

Get a working hipcc compiler: the procedure might be specific to your system/setup. For example, using environment modules:

```
cd rocm-installer-docker/modulefiles
module use --append (pwd)
module load rocm/5.3.3
```

Make the executable

```
cd rocgdb_test
make
```
