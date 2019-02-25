#require "core"
open Core ;;
(*  
istack is a Class
at the same time , we define a  "Object Type" : type istack = <pop; push>
*)
class istack = object
  val mutable v = [0;2]

  method pop = match v with
    | hd:: tl -> v <- tl ; Some hd
    | [] -> None

  method push hd = v <- hd::v

end;;

(* class istack :
   object
    val mutable v : int list
    method pop : int option
    method push : int -> unit
   end *)

let a_stack = new istack   ;;
a_stack#pop 
;;

(* ===================================================================== *)
class ['a] stack (init: 'a list) = object
  val mutable v = init

  method pop = match v with
    | hd:: tl -> v <- tl ; Some hd
    | [] -> None

  method push hd = v <- hd::v

  method fold : 'b.('b->'a -> 'b) ->'b -> 'b = 
    (fun f init -> List.fold ~f ~init v)

end;;

(* ===================================================================== *)

class sstack init = object
  inherit [string] stack init as super

  method print = 
    List.iter ~f:print_string v
end;;


(* ===================================================================== *)

module Stack = struct
  class ['a] stack (init: 'a list) = object
    val mutable v = init

    method pop = match v with
      | hd:: tl -> v <- tl ; Some hd
      | [] -> None

    method push hd = v <- hd::v
  end

  type 'a t = 'a stack

  let make () = new stack []
end;;
(* =================  两种封装方式：   =============================== *)
module AbstractStack : sig
  type 'a t = <pop :'a option ; push :'a -> unit>
  val make : unit -> 'a t
end = Stack
;;

module Visible : sig
  type 'a t = <pop :'a option ; push :'a -> unit>

  class ['a] stack : 'a list -> object
      val mutable v : 'a list
      method pop :'a option
      method push : 'a -> unit
    end

  val make : unit -> 'a t
end = Stack
;;


