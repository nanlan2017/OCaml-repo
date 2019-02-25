
(* local open *)
let average x y = 
  let open Int64 in
  div (add x y) (of_int 2)
;;

let average2 x y = 
  Int64.(div (add x y) (of_int 2))
;;
(* =============================================================== including module*)
(* interval between 2 integers *)
module Interval = struct
  type t = | Interval of int * int
           | Empty

  let create low high = 
    if high < low then Empty else Interval (low,high)
end

module Extended_interval = struct 
  include Interval     (* ~ class inherit 继承*)
  (* open Interval *)  (* ~ class compose 组合*)

  let contains intev x = 
    match intev with
    |Empty -> false
    |Interval(low,high) -> x >= low && x <= high
end

let testvar0 = Extended_interval.contains (Extended_interval.create 3 10) 4 ;;
