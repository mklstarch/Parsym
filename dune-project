(lang dune 3.16)

(using directory-targets 0.1)

(name ParSym)

(generate_opam_files true)

(license MIT)

(package
 (name ParSym)
 (synopsis "Parametric Symbolic Büchi Arithmetic Solver in defferent bases")
 (depends
  ocaml
  dune
  angstrom
  base
  lwt
  ppx_compare
  ppx_assert
  zarith
  bitv
  iter
  ppx_regexp
  ppx_deriving
  ppx_variants_conv
  (smtml
   (>= 0.30.0))
  ounit2
  z3
  ppx_expect
  ppx_inline_test
  mdx
  (ocamlformat
   (and
    :dev
    (= 0.29.0))))
 (tags
  (solver theorem)))
