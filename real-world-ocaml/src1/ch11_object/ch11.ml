
(* 可以直接创建一个object 实例 *)
(* val a_stack : < pop : int option; push : int -> unit > = <obj> *)
let a_stack = object
  val mutable v = [0; 2]

  method pop = match v with
    | hd:: tl -> v <- tl ; Some hd
    | [] -> None

  method push hd = v <- hd::v
end;;

a_stack#pop ;;
a_stack#push 4;;

(* ****************************************************** *)
(* 
一个具有f,g 方法的object 的签名：   < f ; g > 
   ? 意思 object 里的数据默认是 private的 ？ 无法直接访问数据？

create_stack :: 'a list ->       < pop : 'a option; push : 'a -> unit > 
*)
let create_stack init_val = object
  val mutable v = init_val

  method pop = match v with
    | hd:: tl -> v <- tl ; Some hd
    | [] -> None

  method push hd = v <- hd::v
end;;

let b_stack = create_stack [5;6;7] ;;
b_stack#pop ;;
(* ****************************************************** *)
(*
 width是个无参的method,
 如果是无参的function则类型需为 Unit -> R 
*)
let area sq :int = sq#width * sq#width ;;
let area' (sq:<width:int>) :int = sq#width * sq#width ;;