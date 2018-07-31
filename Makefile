CRYSTAL=crystal

all: format test build run

format:
	$(CRYSTAL) tool format

test:
	$(CRYSTAL) spec

build:
	mkdir -p bin
	$(CRYSTAL) build src/entrypoint/main.cr -o bin/main

clean:
	rm -rf bin

run:
	bin/main
