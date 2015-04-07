.PHONY: all build test clean

all: build
	
build:
	mkdir -p build && cd build && cmake .. && make



test:
	build/sample_cpp_project_test


clean:
	rm -rf build

