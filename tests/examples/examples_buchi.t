Test on LIA with Buchi-V predicate (symbolic)
  $ ParSym example_buchi.smt2
  sat
  (
     (define-fun A () Int
      99)
     (define-fun B () Int
      1)
     (define-fun C () Int
      940)
     (define-fun E () Int
      -799)
  )

Test on LIA with Buchi-V predicate (parametric)
  $ timeout 5 ParSym example_buchi.smt2 -par
  sat
  (
     (define-fun A () Int
      999)
     (define-fun B () Int
      1)
     (define-fun C () Int
      9973)
     (define-fun E () Int
      -9900)
  )

Test on LIA with Buchi-V predicate from Intro (symbolic) in bases 2--10
  $ ParSym example_intro.smt2 -bmin 2 -bmax 10
  base 2: sat
  base 3: unsat
  base 4: sat
  base 5: sat
  base 6: unsat
  base 7: sat
  base 8: sat
  base 9: unsat
  base 10: sat
  unsat
  
  models for each base:
  base 2: 
  (
     (define-fun A () Int
      4)   (define-fun B () Int
      1)
  )
  base 3: 
  no model
  base 4: 
  (
     (define-fun A () Int
      4)   (define-fun B () Int
      1)
  )
  base 5: 
  (
     (define-fun A () Int
      25)   (define-fun B () Int
      8)
  )
  base 6: 
  no model
  base 7: 
  (
     (define-fun A () Int
      7)   (define-fun B () Int
      2)
  )
  base 8: 
  (
     (define-fun A () Int
      64)   (define-fun B () Int
      21)
  )
  base 9: 
  no model
  base 10: 
  (
     (define-fun A () Int
      10)   (define-fun B () Int
      3)
  )

Test on LIA with Buchi-V predicate from Intro (symbolic) in bases 200--210
  $ ParSym example_intro.smt2 -bmin 200 -bmax 210
  base 200: sat
  base 201: unsat
  base 202: sat
  base 203: sat
  base 204: unsat
  base 205: sat
  base 206: sat
  base 207: unsat
  base 208: sat
  base 209: sat
  base 210: unsat
  unsat
  
  models for each base:
  base 200: 
  (
     (define-fun A () Int
      40000)   (define-fun B () Int
      13333)
  )
  base 201: 
  no model
  base 202: 
  (
     (define-fun A () Int
      202)   (define-fun B () Int
      67)
  )
  base 203: 
  (
     (define-fun A () Int
      41209)   (define-fun B () Int
      13736)
  )
  base 204: 
  no model
  base 205: 
  (
     (define-fun A () Int
      205)   (define-fun B () Int
      68)
  )
  base 206: 
  (
     (define-fun A () Int
      42436)   (define-fun B () Int
      14145)
  )
  base 207: 
  no model
  base 208: 
  (
     (define-fun A () Int
      208)   (define-fun B () Int
      69)
  )
  base 209: 
  (
     (define-fun A () Int
      43681)   (define-fun B () Int
      14560)
  )
  base 210: 
  no model

Test on LIA with Buchi-V predicate from Intro (parametric) in bases 2--10
  $ ParSym example_intro.smt2 -bmin 2 -bmax 10 -par
  base 2: sat
  base 3: unsat
  base 4: sat
  base 5: sat
  base 6: unsat
  base 7: sat
  base 8: sat
  base 9: unsat
  base 10: sat
  unsat
  
  models for each base:
  base 2: 
  (
     (define-fun A () Int
      4)   (define-fun B () Int
      1)
  )
  base 3: 
  no model
  base 4: 
  (
     (define-fun A () Int
      4)   (define-fun B () Int
      1)
  )
  base 5: 
  (
     (define-fun A () Int
      25)   (define-fun B () Int
      8)
  )
  base 6: 
  no model
  base 7: 
  (
     (define-fun A () Int
      7)   (define-fun B () Int
      2)
  )
  base 8: 
  (
     (define-fun A () Int
      64)   (define-fun B () Int
      21)
  )
  base 9: 
  no model
  base 10: 
  (
     (define-fun A () Int
      10)   (define-fun B () Int
      3)
  )

Test on LIA with Buchi-V predicate from Intro (parametric) in bases 200--210
  $ ParSym example_intro.smt2 -bmin 200 -bmax 210 -par
  base 200: sat
  base 201: unsat
  base 202: sat
  base 203: sat
  base 204: unsat
  base 205: sat
  base 206: sat
  base 207: unsat
  base 208: sat
  base 209: sat
  base 210: unsat
  unsat
  
  models for each base:
  base 200: 
  (
     (define-fun A () Int
      40000)   (define-fun B () Int
      13333)
  )
  base 201: 
  no model
  base 202: 
  (
     (define-fun A () Int
      202)   (define-fun B () Int
      67)
  )
  base 203: 
  (
     (define-fun A () Int
      41209)   (define-fun B () Int
      13736)
  )
  base 204: 
  no model
  base 205: 
  (
     (define-fun A () Int
      205)   (define-fun B () Int
      68)
  )
  base 206: 
  (
     (define-fun A () Int
      42436)   (define-fun B () Int
      14145)
  )
  base 207: 
  no model
  base 208: 
  (
     (define-fun A () Int
      208)   (define-fun B () Int
      69)
  )
  base 209: 
  (
     (define-fun A () Int
      43681)   (define-fun B () Int
      14560)
  )
  base 210: 
  no model
