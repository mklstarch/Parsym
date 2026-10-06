open Lib
open AstL
open AstL.Lia

let c n = const (Z.of_int n)
let t1 = Atom (Var "t1")
let t0 = get_par 0
let a = get 0
let label prev state =
  land_
    [ Lia (leq t1 (add [ c state; mul [ c (-prev); t0 ] ]))
    ; Lia (geq t1 (add [ c state; mul [ c (-(prev + 1)); t0 ] ])) ]
let extra = land_ [ true_; Lia (eq t1 (add [ mul [ c (-1); a ] ])) ]
let a_is n = Lia (eq a (c n))

let show name ph =
  Format.printf "%s:@.  in : %a@.  out: %a@.@." name AstL.pp ph AstL.pp (SimplI.simplify_lia ph)

let () =
  show "A=0,A=0 & (-4 -> -10)" (land_ [ land_ [ a_is 0; a_is 0 ]; label (-4) (-10); extra ]);
  show "A=0 & (-4 -> -10)" (land_ [ a_is 0; label (-4) (-10); extra ]);
  show "A=0,A=0 & (-3 -> -10)" (land_ [ land_ [ a_is 0; a_is 0 ]; label (-3) (-10); extra ]);
  show "A=1 & (-4 -> -10)" (land_ [ a_is 1; label (-4) (-10); extra ]);
  show "t1=0 & (-4 -> -10)" (land_ [ label (-4) (-10); Lia (eq t1 (c 0)) ]);
  show "0 <= -10 + 4 t0" (Lia (leq (c 0) (add [ c (-10); mul [ c 4; t0 ] ])));
  show "-10 + 3 t0 <= 0" (Lia (leq (add [ c (-10); mul [ c 3; t0 ] ]) (c 0)));
  show "both" (land_ [ Lia (leq (c 0) (add [ c (-10); mul [ c 4; t0 ] ])); Lia (leq (add [ c (-10); mul [ c 3; t0 ] ]) (c 0)) ])

(* brute-force soundness check of simplify_lia on random linear constraints *)
let rec eval_term env = function
  | Const z -> z
  | Atom (Var v) -> List.assoc v env
  | Add ts -> List.fold_left (fun acc t -> Z.add acc (eval_term env t)) Z.zero ts
  | Mul ts -> List.fold_left (fun acc t -> Z.mul acc (eval_term env t)) Z.one ts
  | Mod (t, m) -> Z.erem (eval_term env t) m

let rec eval env = function
  | AstL.True -> true
  | Lnot p -> not (eval env p)
  | Land ps -> List.for_all (eval env) ps
  | Lor ps -> List.exists (eval env) ps
  | Lia (Eq (l, r)) -> Z.equal (eval_term env l) (eval_term env r)
  | Lia (Neq (l, r)) -> not (Z.equal (eval_term env l) (eval_term env r))
  | Lia (Leq (l, r)) -> Z.leq (eval_term env l) (eval_term env r)
  | _ -> failwith "eval"

let () =
  Random.init 7;
  let vars = [ "t0"; "lia0" ] in
  let rnd_side () =
    let terms =
      List.filter_map
        (fun v ->
           match Random.int 3 with
           | 0 -> None
           | _ -> Some (mul [ c (Random.int 13 - 6); Atom (Var v) ]))
        vars
    in
    let k = Random.int 25 - 12 in
    match Random.int 3, terms with
    | 0, [] -> c k
    | 0, [ t ] -> t
    | _ -> add (c k :: terms)
  in
  let bad = ref 0 in
  for _ = 1 to 20000 do
    let l, r = rnd_side (), rnd_side () in
    let ph = if Random.bool () then Lia (leq l r) else Lia (eq l r) in
    let ph' = SimplI.simplify_lia ph in
    let ok = ref true in
    for x = -8 to 8 do
      for y = -8 to 8 do
        let env = [ "t0", Z.of_int x; "lia0", Z.of_int y ] in
        if eval env ph <> eval env ph' then ok := false
      done
    done;
    if not !ok then (
      incr bad;
      if !bad <= 10 then Format.printf "MISMATCH: %a  ~~>  %a@." AstL.pp ph AstL.pp ph')
  done;
  Format.printf "mismatches: %d / 20000@." !bad
