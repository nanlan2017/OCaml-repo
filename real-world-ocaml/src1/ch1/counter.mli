#require "core"
(* 
ml  : module          ( abc_d.ml => "Abc_d")
mli :  module interface
 *)

open Core.Std

(*    [hide the type]
      (string*int) list 
*)
type t
val empty : t
val touch : t-> string -> t
val to_list: t -> (string*int) list



