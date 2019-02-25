#require "core"
open Core;;


let digit_alist = [0,"zero"; 1,"one"]

let testvar0 = List.Assoc.find digit_alist 6;;

(* ============================================================= *)
module type Counter = sig
  type t
  val empty : t
  val touch : t -> string -> t
  val to_list : t -> (string*int) list

  (* end = struct 

     type t = int String.Map.t

     let empty = String.Map.empty

     let to_list tab = Map.to_alist tab

     let touch tab s = 
      let count = match Map.find tab s with 
        | None -> 0
        | Some x -> x 
      in Map.add tab ~key:s ~data:(count + 1) *)

end;;