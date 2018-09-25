CRYSTAL=crystal

all: format test build

clean:
	rm -rf bin

format:
	$(CRYSTAL) tool format

test:
	$(CRYSTAL) spec

build:
	mkdir -p bin
	$(CRYSTAL) build src/entrypoint/collatz.cr -o bin/collatz

run:
	bin/collatz
