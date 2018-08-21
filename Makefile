CRYSTAL=crystal

all: format test build run

clean:
	rm -rf bin

format:
	$(CRYSTAL) tool format

test:
	$(CRYSTAL) spec

build:
	mkdir -p bin
	$(CRYSTAL) build src/entrypoint/main.cr -o bin/main

run:
	bin/main
