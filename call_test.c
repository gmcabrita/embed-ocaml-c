#include <stdio.h>
#include <assert.h>

#include <caml/alloc.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/callback.h>

#define ANSI_GREEN  "\x1b[32m"
#define ANSI_RESET  "\x1b[0m"
#define ANSI_RED    "\x1b[31m"

static void ocaml_test_return_int(void) {
    CAMLparam0();
    CAMLlocal1(res);

    value *func = caml_named_value("test_return_int");

    printf("Running test_return_int... ");
    if (func == NULL) {
        printf(ANSI_RED "\tFAIL\t" ANSI_RESET "Error retrieving function.\n");
    } else {
        res = caml_callback(*func, Val_unit);
        assert(5 + Int_val(res) == 10);

        printf(ANSI_GREEN "\tOK\n" ANSI_RESET);
    }

    CAMLreturn0;
}

static void ocaml_test_return_string(void) {
    CAMLparam0();
    CAMLlocal1(res);

    value *func = caml_named_value("test_return_string");

    printf("Running test_return_string... ");
    if (func == NULL) {
        printf(ANSI_RED "\tFAIL\t" ANSI_RESET "Error retrieving function.\n");
    } else {
        res = caml_callback(*func, Val_unit);
        assert(!strcmp(String_val(res), "UROP"));

        printf(ANSI_GREEN "\tOK\n" ANSI_RESET);
    }

    CAMLreturn0;
}

static void ocaml_test_pass_integer(void) {
    CAMLparam0();
    CAMLlocal1(res);

    value *func = caml_named_value("test_pass_integer");
    func = NULL;

    printf("Running test_pass_integer... ");
    if (func == NULL) {
        printf(ANSI_RED "\tFAIL\t" ANSI_RESET "Error retrieving function.\n");
    } else {
        res = caml_callback(*func, Val_int(5));
        assert(Int_val(res) == 6);

        printf(ANSI_GREEN "\tOK\n" ANSI_RESET);
    }

    CAMLreturn0;
}

int main(int argc, char **argv) {
    caml_startup(argv); // startup or main?

    ocaml_test_return_int();
    ocaml_test_return_string();
    ocaml_test_pass_integer();
    printf("All tests ran successfully.\n");

    return 0;
}