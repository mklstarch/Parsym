Trivial Test on LIA with Buchi-V predicate (symbolic)
  $ ParSym test.smt2 -bmin 2 -bmax 10
  base 2: sat
  base 3: sat
  base 4: sat
  base 5: sat
  base 6: sat
  base 7: sat
  base 8: sat
  base 9: sat
  base 10: sat
  sat
  
  models for each base:
  base 2: 
  (
     (define-fun A () Int
      16)
  )
  base 3: 
  (
     (define-fun A () Int
      27)
  )
  base 4: 
  (
     (define-fun A () Int
      16)
  )
  base 5: 
  (
     (define-fun A () Int
      25)
  )
  base 6: 
  (
     (define-fun A () Int
      36)
  )
  base 7: 
  (
     (define-fun A () Int
      49)
  )
  base 8: 
  (
     (define-fun A () Int
      64)
  )
  base 9: 
  (
     (define-fun A () Int
      81)
  )
  base 10: 
  (
     (define-fun A () Int
      10)
  )

Trivial Test on LIA with Buchi-V predicate (parametric)
  $ ParSym test.smt2 -bmin 2 -bmax 10
  base 2: sat
  base 3: sat
  base 4: sat
  base 5: sat
  base 6: sat
  base 7: sat
  base 8: sat
  base 9: sat
  base 10: sat
  sat
  
  models for each base:
  base 2: 
  (
     (define-fun A () Int
      16)
  )
  base 3: 
  (
     (define-fun A () Int
      27)
  )
  base 4: 
  (
     (define-fun A () Int
      16)
  )
  base 5: 
  (
     (define-fun A () Int
      25)
  )
  base 6: 
  (
     (define-fun A () Int
      36)
  )
  base 7: 
  (
     (define-fun A () Int
      49)
  )
  base 8: 
  (
     (define-fun A () Int
      64)
  )
  base 9: 
  (
     (define-fun A () Int
      81)
  )
  base 10: 
  (
     (define-fun A () Int
      10)
  )

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
