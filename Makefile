all: rocgdb_test

rocgdb_test: rocgdb_test.hip
	hipcc -ggdb -fstandalone-debug -Xclang -O0 -Xclang -gcodeview $< -o $@

clean:
	rm -rf rocgdb_test

