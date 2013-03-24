external c_test_return_int: int -> int = "test_return_int"

let test_return_int () = 5;;

let test_return_string () = "UROP";;

let test_pass_integer n = n + 1;;

let test_call_c () = c_test_return_int(5) * 5;;

let () =
    Callback.register "test_return_int" test_return_int;
    Callback.register "test_return_string" test_return_string;
    Callback.register "test_pass_integer" test_pass_integer;
    Callback.register "test_call_c" test_call_c;
;;