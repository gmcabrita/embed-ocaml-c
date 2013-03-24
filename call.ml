let test_return_int () = 5;;

let test_return_string () = "UROP";;

let test_pass_integer n = n + 1;;

let () =
    Callback.register "test_return_int" test_return_int;
    Callback.register "test_return_string" test_return_string;
    Callback.register "test_pass_integer" test_pass_integer;
;;