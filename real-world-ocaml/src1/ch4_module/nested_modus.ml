(* #require "core"
   open Core.Std *)

(*  
this module-definition (Signatures & Implemention) is not in Username.ml & Username.mli separately
but in module Modus
*)

(*
   ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ module Username (: <sig..end>) = <struct..end>  
                                      【module type】
                                    可选的module interface (▇▇▇▇▇▇▇默认的Interface是全部导出)
                      class Dog : Interface IAnimal = class-body
*)
module Username : sig
  type t      (* Abstract type *)
  val of_string: string -> t
  val to_string : t-> string
end = struct
  type t = string
  let of_string x = x
  let to_string x = x
end

module Hostname : sig
  type t      (* Abstract type *)
  val of_string: string -> t
  val to_string : t-> string
end = struct
  type t = string
  let of_string x = x
  let to_string x = x
end
(* =========================================================================== *)
(* 相当于<sig...end> 中间这一段可以复用 *)
module type ID = sig
  type t            (* ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇如果是Concrete type， 则会检查出 Username.type = string = Hostname.type  *)
  val of_string : string -> t
  val to_string : t->string
end

(* 提供一个实现(并未声明是为了哪个module type) *)
module String_id = struct
  type t = string
  let of_string x = x
  let to_string x = x
end   

(*  
2 module use same module-signature & implemention
but they are different module
*)
module Username2 : ID = String_id
module Hostname2 : ID = String_id
(* =========================================================================== *)
type session_info = {
  username : Username2.t;
  hostname: Hostname2.t;
}

let test_type session1 session2 = 
  (* session1.username = session2.hostname    ; *)
  session1.username = session2.username
;;
