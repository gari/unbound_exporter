default: build_rpm

build:
	echo "build"
	./build_static.sh

build_rpm:
	echo "build_rpm"
	./build_rpm.sh