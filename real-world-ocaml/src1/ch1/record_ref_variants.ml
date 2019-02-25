(*  ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇
    ML is not pure FP
    because it has:
        mutable Record
        ref 
    ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇*)

(* 
type record
mutable record
ref variable
*)



(* 
record-type : name is encoded with the tuple struct  , it's unique ! -- {list<id> }-> list<id,Type> 
*)
type point2d = {x:float; y:float};;
type point2di = {x:int; y:float};;

let p1 = {x= 1 ; y= 2.};;
let p2:point2d = {x= 1.1; y= 2.2};;

(* 
{  } is used to match tuples / records
*)
let dist v1 v2 = 
  v1.x - v2.x
;;
let dist2 (v1:point2d) (v2:point2d) = 
  v1.x -. v2.x
;;


(* ========================================================================== *)
(*  
let x = ..      ▇▇ =  is used for create a new binding
x <- newx       ▇▇ <-  is used for mutable record field assignment (Imperative Style)
*)
let sayhi () = print_string "hi\n";;


type mut_man = {
  mutable age : int ;
  a2 : int
}

let update_age man new_age = 
  man.age <- new_age
;;
(* ==========================================================================▇▇▇▇▇▇  ref : create mutable varible *)
(* reference type (pointer) 

   ref : create
   !   : deref
   :=  : setref

*)
let varx = ref 0 ;;  
!varx ;;
varx := !varx + 1 ;;

(*
ref is implemented simply using mutable-record 
 *)
type 'a my_ref = { mutable target: 'a}
let make_ref x = {target = x}
let de_ref x = x.target
let set_ref r x = r.target <- x
;;

let sum list = 
  let res = make_ref 0 in
  List.iter (fun x -> set_ref res (de_ref res + x)) list ;
  de_ref res
;;

let sum2 list = 
  let res = ref 0 in
  List.iter (fun x -> res := !res + x) list ;
  !res 
;;
(* ========================================================================== for /while*)
(*  
for - to - do - done
while - do - done
*)
let random_change arr = 
  let length = Array.length arr in
  for i = 0 to length - 2 do
    let j = i + Random.int (length-1) in
    let tmp = arr.(i) in
    arr.(i) <- arr.(j);
    arr.(j) <- tmp
  done
;;

(* 
this is Main-entry, 
 then core build will run this script 
 otherwise, just make a lib
*)
let () = print_string "start...\n" ;;