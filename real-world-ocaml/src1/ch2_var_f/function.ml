(*  
anonymous function
multi-args func
recursive func
prefix/infix operator

declare function with 'function'
labeled argument
Optional argument
*)

(* Curring is auto done ! *)
let absdiff x y = abs (x - y);;
let abs_3 = absdiff 3;;

(* using tuple as args-wrapper *)
let absdiff2 (x,y) = abs (x - y);;
absdiff2 (3,7);;

(*  Syntax Sugar

    ... (last_param = match last_param with) ...
    ...  = function  |patterns....
*)
let some_or_zero = function
  | Some x -> x
  | _ -> 0
;;

let my_ratio ~num ~denum = float num /. float denum;;

my_ratio ~num:(3) ~denum:4
;;


let my_concat ?(separator="") x y = x ^ separator ^ y;;