Trivial Test on LIA with Buchi-V predicate (symbolic)
  $ ParSym test.smt2 -bmin 2 -bmax 10
  sat
  
  models for each base:
  base 2: 
  (
     (define-fun A () Int
      16)
  )
  base 3: 
  no model
  base 4: 
  no model
  base 5: 
  no model
  base 6: 
  no model
  base 7: 
  no model
  base 8: 
  no model
  base 9: 
  no model
  base 10: 
  no model

Trivial Test on LIA with Buchi-V predicate (parametric)
  $ ParSym test.smt2 -bmin 2 -bmax 10
  sat
  
  models for each base:
  base 2: 
  (
     (define-fun A () Int
      16)
  )
  base 3: 
  no model
  base 4: 
  no model
  base 5: 
  no model
  base 6: 
  no model
  base 7: 
  no model
  base 8: 
  no model
  base 9: 
  no model
  base 10: 
  no model

Prime cone with disjunctions
  $ ParSym test.smt2
  sat
  (
     (define-fun A () Int
      10)
  )

Prime cone with disjunctions with lazy computations
  $ ParSym test.smt2 -lazy
  sat
  (
     (define-fun A () Int
      10)
  )

Buchi-V predicate with parametric automata, one base at a time
  $ ParSym test.smt2 -bmin 2 -bmax 2 -par
  sat
  (
     (define-fun A () Int
      16)
  )
  $ ParSym test.smt2 -bmin 3 -bmax 3 -par
  sat
  (
     (define-fun A () Int
      27)
  )
  $ ParSym test.smt2 -bmin 4 -bmax 4 -par
  sat
  (
     (define-fun A () Int
      16)
  )
  $ ParSym test.smt2 -bmin 5 -bmax 5 -par
  sat
  (
     (define-fun A () Int
      25)
  )
