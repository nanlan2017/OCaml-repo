
(*  
'_a -> '_a
而非  'a -> 'a
*)
let remember = 
  let cache = ref None in
  (fun x -> 
     match !cache with
     | Some y -> y
     | None -> cache := Some x ; x 
  )
;;

let f x = x;;

(* let testv0 = remember 3 ;; *)

(*  
partial application  ----->  weakly polymorphic
【eta expansion】
*)
let list_init_10_elems = List.init 10 ;;
let list_init_10_elems' ~f = List.init 10 f ;;