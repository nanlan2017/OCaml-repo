open Format

open Support.Error
open Support.Pervasive
open Syntax

let rec isnumericval = function
  | TmZero(_) -> true
  | TmSucc(_,t1) -> isnumericval t1
  | TmPred(_,t1) -> isnumericval t1   (*  ???  *)
  | _ -> false
;;
let rec isval = function
  | TmTrue(_) -> true
  | TmFalse(_) -> true
  | tm when isnumericval tm -> true
  | _ -> false 

exception NoRuleApplies

(* 1-step reduction :  将一个term 简化为新的 term *)
(* 所有的值都是 term 类型 *)
let rec eval1 = function
  (* if/bool *)
  |TmIf(_, TmTrue(_), t2,t3) 
    -> t2
  |TmIf(_, TmFalse(_), t2,t3) 
    -> t3
  |TmIf(fi, t1,t2,t3) 
    -> let t1' = eval1 t1 in TmIf(fi,t1',t2,t3)

  (* succ *)
  |TmSucc(fi,t1)  
    -> let t1'  = eval1 t1 in TmSucc(fi,t1') 

  (* pred *)
  | TmPred(_,TmZero(_)) 
    -> TmZero(dummyinfo)
  | TmPred(_,TmSucc(_,nv1)) when (isnumericval nv1) 
    -> nv1
  | TmPred(fi,t1) 
    -> let t1' = eval1 t1 in TmPred(fi, t1')

  (* iszero *)
  | TmIsZero(_,TmZero(_)) 
    -> TmTrue(dummyinfo)
  | TmIsZero(_,TmSucc(_,nv1)) when (isnumericval nv1) 
    -> TmFalse(dummyinfo)
  | TmIsZero(fi,t1) 
    -> let t1' = eval1 t1 in TmIsZero(fi, t1')
  | _ 
    -> raise NoRuleApplies

(* let rec eval t = 
   let rec iter tm = iter (eval1 tm) in 
   try iter t
   with NoRuleApplies -> t *)

let rec eval t =
  try let t' = eval1 t
    in eval t'
  with NoRuleApplies -> t
