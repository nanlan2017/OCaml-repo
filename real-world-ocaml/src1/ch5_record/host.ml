
#require "core" ;;
#require "core_extended" ;;
open Core;;
open Core_extended.Std


type host_info = {
  hostname: string;
  time_stamp: Time.t
}

(* "你看你想知道 编译器是如何知道 该类型是 host_info的
   其中的关键就是： field names " *)
let my_host = 
  let sh = Shell.sh_first_line_exn in
  {
    hostname = sh "hostname";
    time_stamp = Time.now ()
  }

(* ==================================================== *)
module Host_info = struct 
  type t = {
    hostname : string;
    time_stamp : Time.t ;
  } 
  (* with fields *)
end

(*  
:: string -> Host_info.t
*)
let create_host_info ~hostname = 
  {
    Host_info.hostname;
    time_stamp = Time.now ()
  }
;;
(* ==================================================== *)

let five   = `Int 5;;
let four = `Float 4.;;

(*  
  Type[> `Int .. | `Float` ..]  至少 拥有这两个Variant的一个类型
*)
let ilst = [five; four];;
(*  
  Type[< `Int .. | `Float` ..]  至多 拥有这两个Variant的一个类型
*)
let is_positive = function
  | `Int x -> x > 0
  | `Float x -> x > 0
;;

let testval2 = List.filter ~f:is_positive ilst ;;    