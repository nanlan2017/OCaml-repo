module type X_int = sig
  val x : int
end;;

module Three : X_int = struct
  let x = 3
end;;

module Four = struct let x = 4 end ;;

(*  
first-class module : 意思就是 module 可以绑定到一个变量（let绑定、参数变量、返回值变量）
*)

let mod_Three = (module Three:X_int) ;;
(*  
类型::  [module X_int]
*)
let mod_list = [mod_Three ; 
                (module Four) ; 
                (module struct let x = 5 end)] ;;


module Unwrapped_mod = (val mod_Three:X_int) ;;
let testval0 = Unwrapped_mod.x ;;


(*      module  vs  val
        (module <struct ~ end>)   ===>  ValModule
        (val  ValModule)   ===> <struct ~ end >
*)

let get_inner_int mdu = 
  let module M = (val mdu : X_int) in
  M.x
;;

(* Unwrap module-val  by pattern matching  (not 'val') *)
let get_inner_int' (module M : X_int) = M.x ;;

let plus_inner_mod a_mod b_mod =
  (module struct 
    let x = get_inner_int a_mod + get_inner_int b_mod 
  end : X_int)
;; 

let mod_Six = plus_inner_mod mod_Three mod_Three ;;