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

Disjunction with -lazy: an atom false on the input does not stop the search
  $ cat > or.smt2 <<EOF
  > (set-logic QF_SLIA)
  > (declare-fun A () Int)
  > (assert (or (= A 5) (= A 7)))
  > (check-sat)
  > EOF
  $ ParSym or.smt2 -base 3 -lazy
  sat
  $ ParSym or.smt2 -bmin 3 -bmax 3 -par -lazy
  sat

Model of a variable that occurs in a single equation (A = -2)
  $ cat > single.smt2 <<EOF
  > (set-logic QF_SLIA)
  > (declare-fun A () Int)
  > (declare-fun B () Int)
  > (declare-fun C () Int)
  > (assert (= (* (- 1) A) 2))
  > (assert (or (int.v (+ (* 2 C) (- 1)) C) (>= (* (- 3) B) 7)))
  > (check-sat)
  > (get-model)
  > EOF
  $ ParSym single.smt2 -base 3 | grep -A1 'fun A'
     (define-fun A () Int
      -2)
  $ ParSym single.smt2 -bmin 3 -bmax 3 -par | grep -A1 'fun A'
     (define-fun A () Int
      -2)

Negated int.v: the constraints defining internal variables are not negated
  $ cat > notv.smt2 <<EOF
  > (set-logic QF_SLIA)
  > (declare-fun A () Int)
  > (declare-fun B () Int)
  > (assert (not (int.v (+ A 1) B)))
  > (assert (= A 5))
  > (assert (= B 3))
  > (check-sat)
  > EOF
  $ ParSym notv.smt2 -base 3
  unsat
  $ ParSym notv.smt2 -bmin 3 -bmax 3 -par
  unsat

Negated int.v alone: the empty input is not a model
  $ cat > notv2.smt2 <<EOF
  > (set-logic QF_SLIA)
  > (declare-fun A () Int)
  > (declare-fun B () Int)
  > (assert (not (int.v A B)))
  > (check-sat)
  > (get-model)
  > EOF
  $ ParSym notv2.smt2 -base 3 | head -1
  sat
  $ ParSym notv2.smt2 -bmin 3 -bmax 3 -par | head -1
  sat
