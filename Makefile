default: build_go build_rpm

build_go:
	go build .

build_static:
	echo "build"
	./build_static.sh

build_rpm:
	echo "build_rpm"
	./build_rpm.sh $(ARGS)