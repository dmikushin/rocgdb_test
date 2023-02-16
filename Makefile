all: rocgdb_test

# Debug-enabling flags are set according to:
# http://mikush.in/blog/2022/09/27/enabling-device-debug-in-hip/
rocgdb_test: rocgdb_test.hip
	hipcc -ggdb -fstandalone-debug -Xclang -O0 -Xclang -gcodeview $< -o $@

clean:
	rm -rf rocgdb_test

