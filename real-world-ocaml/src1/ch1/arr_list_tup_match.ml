(*
,  is a tuple-operator 
;  is a separator

var name  :  only _  '  no  -

't Tree
*)


(*     [| |]   [  ]    ( )    { }
       Array  [|a; b; c|]
       List   [a; b; c]
       tuple  (a, b, c)
       record = named tuple  = {id1: T1 ; id2: T2}
*)

let square x = x *. x
;;

let a_tuple = (3, "fuck", 5.6)
;;

(* !!!     ,   is used for create tuples  *)
let b_tuple = 1,2,"love"

let distance (x1,y1) (x2,y2) = 
  sqrt ((x1 -. x2) ** 2. +. (y1 -. y2) ** 2.)
;;
let dis1 = distance (1.1, 2.2) (3.1, 4.2) ;;

square (square 2.0)
;;
(* ================================================================ *)
let a_list = 1::(2::[])
;;
let b_list = a_list @ [4;5]
;;

(* Pattern matching of List *)
let favorite langs = 
  match langs with
  | [elem] -> elem
  | first:: snd:: tail -> first
  | [] -> "OCaml"
;;
(* ================================================================ option a = Some a | None *)
