
(* module-interface *)
module type X_int = sig
  val x : int
end;;

(*  
functor :  Module -> Module

module Increment ::      functor (M : X_int) -> sig val x : int end (module-type)
*)
module Increment (M: X_int) = struct 
  let x = M.x + 1
end;;

(* module-implemention of X_int *)
module Three : X_int = struct
  let x = 3
end;;

module Four : X_int = Increment(Three) ;;
module Five = Increment(Four);;

(* 只要含有 val x:int 就可以任务其适配 X_int 这个module-type *)
module Three_and_more = struct
  let x = 3
  let y = 100
end;;

module Four2 = Increment(Three_and_more);;

(* **************************************************************************************** module extension *)
module type Foldable = sig
  type 'a t
  val fold : 'a t -> init:'acc -> f:('acc-> 'a -> 'acc) -> 'acc
end;;

module type Extend_foldable = sig
  type 'a t
  val iter : 'a t -> f:('a -> unit) -> unit
  val length : 'a t -> int
  val count : 'a t -> f:('a -> bool) -> int
  val for_all : 'a t -> f:('a -> bool) -> bool
  val exists : 'a t -> f:('a -> bool) -> bool
end

(* For extending a Foldable module *)
module Extend(Arg : Foldable)
  : (Extend_foldable with type 'a t := 'a Arg.t) =
struct
  open Arg
  let iter t ~f = fold t ~init:() ~f:(fun () a -> f a)
  let length t = fold t ~init:0 ~f:(fun acc _ -> acc + 1)
  let count t ~f = fold t ~init:0 ~f:(fun count x -> count + if f x then 1 else 0)

  exception Short_circuit
  let for_all c ~f =
    try iter c ~f:(fun x -> if not (f x) then raise Short_circuit); true
    with Short_circuit -> false
  let exists c ~f =
    try iter c ~f:(fun x -> if f x then raise Short_circuit); false
    with Short_circuit -> true
end

