# math-x
Playground project built in [Crystal](https://crystal-lang.org/)
aiming to better understand the [Collatz conjecture](https://en.wikipedia.org/wiki/Collatz_conjecture)
nuances and patterns

### The Collatz conjecture
Start with any positive integer n
* If the number is even, divide it by two (n / 2)
* If the number is odd, triple it and add one (n * 3 + 1)
Repeat the process by assigning the result to n

The conjecture states that, no matter what value of n, the sequence will always reach 1

### Pre-requisites
* Download [Crystal](https://crystal-lang.org/docs/installation/on_debian_and_ubuntu.html)
  * version: 0.26+

### Run it
Leveraging Makefile it's possible to format, test, compile and execute code with
`make all`

Alternatively you can execute each action individually:
* Clean - Removes any executables: `make clean`
* Format - Forces correct formating: `make format`
* Test - Runs all tests: `make test`
* Build - Compiles code: `make build`
* Run - Runs code: `make run`
