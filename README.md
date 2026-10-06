# Parsym

Parsym is an SMT solver for quantifier-free Büchi arithmetic with regular
constraints. For a base k ≥ 2, Büchi arithmetic is linear integer arithmetic
extended with the predicate V_k, where V_k(x, y) holds if y is the largest power
of k that divides x. Parsym decides satisfiability in one base k, or in every
base of an interval [bmin, bmax].

Each atomic constraint is translated into a symbolic automaton that reads the
base-k digits of the variables, most significant digit first. A model is a path
to a final state; Z3 chooses the successor states on this path.

## Input

An SMT-LIB 2 script; the examples use `(set-logic QF_SLIA)`.

| Construct | Meaning |
|---|---|
| `Int` and `String` variables | |
| `+`, `-`, multiplication by a constant, `mod` by a constant | linear terms |
| `=`, `distinct`, `<`, `<=`, `>`, `>=`, `not`, `and`, `or`, `=>` | |
| `(int.v x y)` | V_k(x, y) |
| `(str.in_re s r)`, `(str.to_int s)` | `s` is a string of base-k digits |
| `str.to_re`, `re.range`, `re.++`, `re.union`, `re.inter`, `re.*`, `re.+`, `re.opt`, `re.loop` | regular expressions |
| `check-sat`, `get-model`, `push`, `pop` | commands |

Not supported: multiplication of two variables, `re.comp`, `ite`.

## Usage

```
ParSym [options] file.smt2
```

`tests/test.smt2` states that A is a power of the base and A ≥ 10:

```
$ ParSym tests/test.smt2 -base 3
sat
(
   (define-fun A () Int
    27)
)
```

| Option | Meaning |
|---|---|
| `-base <k>` | use the base k (default 10) |
| `-bmin <k>`, `-bmax <k>` | use every base in [bmin, bmax] |
| `-problem e` | interval of bases: `sat` if the formula is satisfiable in some base (default) |
| `-problem u` | interval of bases: `sat` if the formula is satisfiable in every base |
| `-par` | build one parametric automaton for the whole interval of bases |
| `-lazy` | search the path without building the automaton for the whole formula |

`ParSym -help` lists the other options.

## Building

```bash
# OCaml 5.3 switch used by the project (selected in .envrc).
opam switch create 5.3.0+flambda --packages=ocaml-variants.5.3.0+options,ocaml-option-flambda --yes

git clone https://github.com/mklstarch/Parsym.git
cd Parsym
# The z3 package compiles Z3 from source, which takes a long time.
opam install . --deps-only --with-test
opam exec -- dune build ./bin/parsym.exe
```

The binary is `_build/default/bin/parsym.exe`.
