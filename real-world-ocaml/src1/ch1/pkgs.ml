#require "core";;
open Core

type point2d = { x :float ; y :float}

type po2d = {x : float ; y : float}

let p1 = { x = 3. ; y = 4. }

let magnitude { x = xp; y = yp} = 
  sqrt ( xp ** 2. +. yp ** 2.) 
;;

(* name must keep same *)
let mag2 {x;y} = sqrt ( x ** 2. +. y ** 2.) 
;;

(* sum :: int list -> int *)
let sum list = 
  let res = ref 0 in
  List.iter list ~f:(fun x -> res := !res + x);
  !res
;;

let testv0 = List.map ~f:((+) 3) [3;5;6] ;; 

(* -------------------------------------------------------------------- *)

(* ignore last parameter to pattern match *)
let some_or_default default = function
  | Some x -> x
  | None -> default
;;


let substr ~pos ~len = String.is_substring pos len
;;








