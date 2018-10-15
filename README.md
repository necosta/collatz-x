# collatz-x
Exploratory project built in [Crystal](https://crystal-lang.org/)

Aims to better understand the nuances and patterns of the [Collatz conjecture](https://en.wikipedia.org/wiki/Collatz_conjecture)

### The Collatz conjecture
Start with any positive integer n and recursively apply the following logic:
* If the number is even, divide it by two (n / 2)
* If the number is odd, triple it and add one (n * 3 + 1)

The conjecture states that, no matter what is the selected value of n, the sequence will always reach 1

### Prerequisites
* Download [Crystal](https://crystal-lang.org/docs/installation/on_debian_and_ubuntu.html)
  * version: 0.26+

### Run it
It's possible to format, test and compile code with `make all`

Alternatively you can execute each action individually:
* Clean - Removes all binaries: `make clean`
* Format - Enforces correct formatting: `make format`
* Test - Runs all tests: `make test`
* Build - Compiles code: `make build`
* Run - Runs code (with default option): `make run`

**Examples:**

* Returns Collatz sequence to a single number:

`./bin/collatz -o RunOnce -v 1634`

* Applies Collatz algorithm recursively starting at a given number:

`./bin/collatz -o RunUpwards -v 1634`

* Checks for &#946;<sup>k</sup> = n solutions for a given number of permutations:

`./bin/collatz -o RunLoopAnalysis -v 1`

* Returns Collatz sequence for long k-iterations values:

`./bin/collatz -o RunSpecial -v 25`

* Shows help:

`./bin/collatz --help`

### Line of thought

Let's organize all positive integers by:
1. Parity - Even or odd
1. Sum of Digits - {1,2,3,4,5,6,7,8,9} (mod 10)

##### Parity
|      n / 2    |   3 * n + 1   | P(X) |
|:-------------:|:-------------:|:----:|
| EVEN -> EVEN  | ODD -> EVEN   | 0.5  |
| EVEN -> ODD   | ODD -> EVEN   | 0.5  |

##### Sum of digits
| n / 2   | 3 * n + 1 |  P(X)  |
|:-------:|:---------:|:------:|
| 1 -> 5  |  1 -> 4   | 0.1(1) |
| 2 -> 1  |  2 -> 7   | 0.1(1) |
| 3 -> 6  |  3 -> 1   | 0.1(1) |
| 4 -> 2  |  4 -> 4   | 0.1(1) |
| 5 -> 7  |  5 -> 7   | 0.1(1) |
| 6 -> 3  |  6 -> 1   | 0.1(1) |
| 7 -> 8  |  7 -> 4   | 0.1(1) |
| 8 -> 4  |  8 -> 7   | 0.1(1) |
| 9 -> 9  |  9 -> 1   | 0.1(1) |

---

##### Flow diagram
* 9 (digits sum comb) * 2 (parity states) = 18 nodes
* 9 (digits sum comb) * 3 (distinct parity transitions) = 27 edges

![Flow diagram](img/flow.jpeg "Flow diagram")

**Singularities:**
* (&#945;) M -> N -> M  (n / 2 * n / 2) (decreases)
* (&#945;) O -> O (n / 2) (decreases)
* (&#946;) K -> K ((3/2) * n + 1) (increases !!!)

**&#945; flows:**

* Any &#945; node will eventually reach 1<sub>EVEN</sub>

**&#946; flows:**

| Id    | Seq         | P(X) | Formula (K<sub>x</sub> -> x) |
|:-----:|:-----------:|:----:|:------------:|
|&#946;<sub>1</sub>|A->H         |1/4   | (3<sup>1</sup> / 2<sup>2</sup>) * n + (3<sup>1</sup> - 2<sup>1</sup>) / 2<sup>0</sup> |
|&#946;<sub>2</sub>|A->B->C->J   |1/16  | (3<sup>1</sup> / 2<sup>4</sup>) * n + (3<sup>1</sup> - 2<sup>1</sup>) / 2<sup>0</sup> |
|&#946;<sub>3</sub>|A->B->C->D->K<sub>x</sub>->E->F |1/32| (3<sup>x</sup> / 2<sup>x+6</sup>) * n + (3<sup>x</sup> - 2<sup>x</sup>) / 2<sup>x+1</sup> |
|&#946;<sub>4</sub>|A->B->C->D->K<sub>x</sub>->E->L |1/32| (3<sup>x+1</sup> / 2<sup>x+6</sup>) * n + (3<sup>x+1</sup> - 2<sup>x</sup>) / 2<sup>x+1</sup> |
|&#946;<sub>5</sub>|A->B->I->K<sub>x</sub>->E->F    |1/16| (3<sup>x+1</sup> / 2<sup>x+5</sup>) * n + (3<sup>x+1</sup> - 2<sup>x+1</sup>) / 2<sup>x+2</sup> |
|&#946;<sub>6</sub>|A->B->I->K<sub>x</sub>->E->L    |1/16| (3<sup>x+2</sup> / 2<sup>x+5</sup>) * n + (3<sup>x+2</sup> - 2<sup>x+1</sup>) / 2<sup>x+2</sup> |
|&#946;<sub>7</sub>|G->K<sub>x</sub>->E->F  |1/4   | (3<sup>x+1</sup> / 2<sup>x+3</sup>) * n + (3<sup>x+1</sup> - 2<sup>x+1</sup>) / 2<sup>x+2</sup> |
|&#946;<sub>8</sub>|G->K<sub>x</sub>->E->L  |1/4   | (3<sup>x+2</sup> / 2<sup>x+3</sup>) * n + (3<sup>x+2</sup> - 2<sup>x+1</sup>) / 2<sup>x+2</sup> |

**1 iteration (generalized):**

## &#946;<sup>1</sup> = (3<sup>x</sup> / 2<sup>y</sup>) * n + (3<sup>x</sup> - 2<sup>z</sup>) / 2<sup>w</sup>

* x &#1013; {1,x,x+1,x+2}
* y &#1013; {2,4,x,x+3,x+5,x+6}
* z &#1013; {1,x,x+1}
* w &#1013; {0,x+1,x+2}

**k iterations (generalized):**

## &#946;<sup>k</sup> = (3<sup>&#931;x<sub>k</sub></sup> / 2<sup>&#931;y<sub>k</sub></sup>) * n + &#931; ((3<sup>a</sup> - 2<sup>b</sup>*3<sup>c</sup>) / 2<sup>d</sup>)

* a,b,c,d (see *analysis.cr*)

---

#### How to prove/disprove conjecture:

1. &#946;<sup>i</sup> > &#946;<sup>i+1</sup>
 * Will all possible flows decrease over time?
    * **yes, proved**

1. &#946;<sup>k</sup> = n
 * Are there no solutions to the above equation, with n > 4 and n integer and n &#8801; 4 (mod 18) ?
    * **to be proven...**

&#946;<sup>i</sup> > &#946;<sup>i+1</sup> => (see *limits.cr*)

| Id    | Seq         | &#946;<sup>i+1</sup> / &#946;<sup>i</sup> |
|:-----:|:-----------:|:----:|
|&#946;<sub>1</sub>|A->H         |3/16   |
|&#946;<sub>2</sub>|A->B->C->J   |3/256  |
|&#946;<sub>3</sub>,&#946;<sub>4</sub>|A->B->C->D->K<sub>x</sub>->E->F&#124;L |1/256|
|&#946;<sub>5</sub>,&#946;<sub>6</sub>|A->B->I->K<sub>x</sub>->E->F&#124;L    |3/64|
|&#946;<sub>7</sub>,&#946;<sub>8</sub>|G->K<sub>x</sub>->E->F&#124;L  |3/4|

&#946;<sup>k</sup> = n => (see *iterator.cr*)

Number of permutations:

```P(n, r) = n! / (n - r)!```

(...n objects taken r at a time...)
