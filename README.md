# Parsym - SMT-solver based on (parametric) symbolic automata for Büchi arithmetic on parametric base 

TODO: Description.

## Building

To build the project from source files you need first to install dependencies:

```bash
# Installing the OCaml package manager
bash -c "sh <(curl -fsSL https://opam.ocaml.org/install.sh)"
# Initializing the package manager. It might ask you to install other common dependencies (e.g. unzip)
opam init --bare
# Installing OCaml 5.3.
opam switch create 5.3.0+flambda --packages=ocaml-variants.5.3.0+options,ocaml-option-flambda --yes
```

'parsym' is built as follows:

```bash

# Clone the Parsym repository.
git clone https://github.com/mklstarch/Parsym.git

# Change directory to Parsym.
cd Parsym

# Installing Parsym dependencies.
opam install . --deps-only --with-test

# Building the project and its tests.
opam exec -- dune build @check @all
```

The executable binary is available in the `_build` dir.
