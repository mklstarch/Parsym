Example with regular and LIA constrints with lazy computations
  $ ParSym example.smt2 -lazy --depth 2
  sat
  (
     (define-fun A () Int
      -3757)
     (define-fun B () Int
      -225)
     (define-fun C () String
      "1111")
     (define-fun E () Int
      2335)
  )

Example with regular and LIA constrints TO = 5 sec
  $ timeout 5 ParSym example.smt2 --depth 2
  timeout
  [124]

Example with LIA constrints with lazy computations
  $ ParSym example_int.smt2 -lazy --depth 2
  sat
  (
     (define-fun A () Int
      -10)
     (define-fun B () Int
      3)
     (define-fun C () Int
      5)
     (define-fun E () Int
      9)
  )

Example with LIA constrints TO = 5 sec
  $ timeout 5 ParSym example_int.smt2 --depth 2
  timeout
  [124]


