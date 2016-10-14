#lang racket

(require ffi/unsafe)
(define lightning-lib (ffi-lib "liblightning"))

(define _jit_free_func_ptr _pointer)
(define _jit_alloc_func_ptr* _pointer)
(define _jit_state_t* _pointer)
(define _jit_bool_t _pointer)
(define _jit_gpr_t _pointer)
(define _jit_word_t _pointer)
(define _jit_word_t* _pointer)
(define _jit_float32_t _pointer)
(define _jit_realloc_func_ptr _pointer)
(define _jit_pointer_t _pointer)
(define _jit_code_t _pointer)
(define _int _pointer)
(define _jit_realloc_func_ptr* _pointer)
(define _int* _pointer)
(define _const_char* _pointer)
(define _void _pointer)
(define _jit_free_func_ptr* _pointer)
(define _jit_node_t* _pointer)
(define _jit_fpr_t _pointer)
(define _jit_int32_t _pointer)
(define _char** _pointer)
(define _jit_alloc_func_ptr _pointer)
(define _jit_float64_t _pointer)

(define (get-error-thunk func-name)
  (lambda ()
    (error 'auto-ffi-load (format "error loading function ~a" func-name))))
(define init-jit
  (get-ffi-obj
   "init_jit"
   lightning-lib
   (_fun _const_char* -> _void)
   (get-error-thunk "init_jit")))
(define finish-jit
  (get-ffi-obj
   "finish_jit"
   lightning-lib
   (_fun _void -> _void)
   (get-error-thunk "finish_jit")))
(define jit-new-state
  (get-ffi-obj
   "jit_new_state"
   lightning-lib
   (_fun _void -> _jit_state_t*)
   (get-error-thunk "jit_new_state")))
(define jit-clear-state
  (get-ffi-obj
   "_jit_clear_state"
   lightning-lib
   (_fun _jit_state_t* -> _void)
   (get-error-thunk "_jit_clear_state")))
(define jit-destroy-state
  (get-ffi-obj
   "_jit_destroy_state"
   lightning-lib
   (_fun _jit_state_t* -> _void)
   (get-error-thunk "_jit_destroy_state")))
(define jit-address
  (get-ffi-obj
   "_jit_address"
   lightning-lib
   (_fun _jit_state_t* _jit_node_t* -> _jit_pointer_t)
   (get-error-thunk "_jit_address")))
(define jit-name
  (get-ffi-obj
   "_jit_name"
   lightning-lib
   (_fun _jit_state_t* _const_char* -> _jit_node_t*)
   (get-error-thunk "_jit_name")))
(define jit-note
  (get-ffi-obj
   "_jit_note"
   lightning-lib
   (_fun _jit_state_t* _const_char* _int -> _jit_node_t*)
   (get-error-thunk "_jit_note")))
(define jit-label
  (get-ffi-obj
   "_jit_label"
   lightning-lib
   (_fun _jit_state_t* -> _jit_node_t*)
   (get-error-thunk "_jit_label")))
(define jit-forward
  (get-ffi-obj
   "_jit_forward"
   lightning-lib
   (_fun _jit_state_t* -> _jit_node_t*)
   (get-error-thunk "_jit_forward")))
(define jit-indirect
  (get-ffi-obj
   "_jit_indirect"
   lightning-lib
   (_fun _jit_state_t* -> _jit_node_t*)
   (get-error-thunk "_jit_indirect")))
(define jit-link
  (get-ffi-obj
   "_jit_link"
   lightning-lib
   (_fun _jit_state_t* _jit_node_t* -> _void)
   (get-error-thunk "_jit_link")))
(define jit-forward-p
  (get-ffi-obj
   "_jit_forward_p"
   lightning-lib
   (_fun _jit_state_t* _jit_node_t* -> _jit_bool_t)
   (get-error-thunk "_jit_forward_p")))
(define jit-indirect-p
  (get-ffi-obj
   "_jit_indirect_p"
   lightning-lib
   (_fun _jit_state_t* _jit_node_t* -> _jit_bool_t)
   (get-error-thunk "_jit_indirect_p")))
(define jit-target-p
  (get-ffi-obj
   "_jit_target_p"
   lightning-lib
   (_fun _jit_state_t* _jit_node_t* -> _jit_bool_t)
   (get-error-thunk "_jit_target_p")))
(define jit-prolog
  (get-ffi-obj
   "_jit_prolog"
   lightning-lib
   (_fun _jit_state_t* -> _void)
   (get-error-thunk "_jit_prolog")))
(define jit-allocai
  (get-ffi-obj
   "_jit_allocai"
   lightning-lib
   (_fun _jit_state_t* _jit_int32_t -> _jit_int32_t)
   (get-error-thunk "_jit_allocai")))
(define jit-arg
  (get-ffi-obj
   "_jit_arg"
   lightning-lib
   (_fun _jit_state_t* -> _jit_node_t*)
   (get-error-thunk "_jit_arg")))
(define jit-getarg-c
  (get-ffi-obj
   "_jit_getarg_c"
   lightning-lib
   (_fun _jit_state_t* _jit_gpr_t _jit_node_t* -> _void)
   (get-error-thunk "_jit_getarg_c")))
(define jit-getarg-uc
  (get-ffi-obj
   "_jit_getarg_uc"
   lightning-lib
   (_fun _jit_state_t* _jit_gpr_t _jit_node_t* -> _void)
   (get-error-thunk "_jit_getarg_uc")))
(define jit-getarg-s
  (get-ffi-obj
   "_jit_getarg_s"
   lightning-lib
   (_fun _jit_state_t* _jit_gpr_t _jit_node_t* -> _void)
   (get-error-thunk "_jit_getarg_s")))
(define jit-getarg-us
  (get-ffi-obj
   "_jit_getarg_us"
   lightning-lib
   (_fun _jit_state_t* _jit_gpr_t _jit_node_t* -> _void)
   (get-error-thunk "_jit_getarg_us")))
(define jit-getarg-i
  (get-ffi-obj
   "_jit_getarg_i"
   lightning-lib
   (_fun _jit_state_t* _jit_gpr_t _jit_node_t* -> _void)
   (get-error-thunk "_jit_getarg_i")))
(define jit-getarg-ui
  (get-ffi-obj
   "_jit_getarg_ui"
   lightning-lib
   (_fun _jit_state_t* _jit_gpr_t _jit_node_t* -> _void)
   (get-error-thunk "_jit_getarg_ui")))
(define jit-getarg-l
  (get-ffi-obj
   "_jit_getarg_l"
   lightning-lib
   (_fun _jit_state_t* _jit_gpr_t _jit_node_t* -> _void)
   (get-error-thunk "_jit_getarg_l")))
(define jit-putargr
  (get-ffi-obj
   "_jit_putargr"
   lightning-lib
   (_fun _jit_state_t* _jit_gpr_t _jit_node_t* -> _void)
   (get-error-thunk "_jit_putargr")))
(define jit-putargi
  (get-ffi-obj
   "_jit_putargi"
   lightning-lib
   (_fun _jit_state_t* _jit_word_t _jit_node_t* -> _void)
   (get-error-thunk "_jit_putargi")))
(define jit-prepare
  (get-ffi-obj
   "_jit_prepare"
   lightning-lib
   (_fun _jit_state_t* -> _void)
   (get-error-thunk "_jit_prepare")))
(define jit-ellipsis
  (get-ffi-obj
   "_jit_ellipsis"
   lightning-lib
   (_fun _jit_state_t* -> _void)
   (get-error-thunk "_jit_ellipsis")))
(define jit-pushargr
  (get-ffi-obj
   "_jit_pushargr"
   lightning-lib
   (_fun _jit_state_t* _jit_gpr_t -> _void)
   (get-error-thunk "_jit_pushargr")))
(define jit-pushargi
  (get-ffi-obj
   "_jit_pushargi"
   lightning-lib
   (_fun _jit_state_t* _jit_word_t -> _void)
   (get-error-thunk "_jit_pushargi")))
(define jit-finishr
  (get-ffi-obj
   "_jit_finishr"
   lightning-lib
   (_fun _jit_state_t* _jit_gpr_t -> _void)
   (get-error-thunk "_jit_finishr")))
(define jit-finishi
  (get-ffi-obj
   "_jit_finishi"
   lightning-lib
   (_fun _jit_state_t* _jit_pointer_t -> _jit_node_t*)
   (get-error-thunk "_jit_finishi")))
(define jit-ret
  (get-ffi-obj
   "_jit_ret"
   lightning-lib
   (_fun _jit_state_t* -> _void)
   (get-error-thunk "_jit_ret")))
(define jit-retr
  (get-ffi-obj
   "_jit_retr"
   lightning-lib
   (_fun _jit_state_t* _jit_gpr_t -> _void)
   (get-error-thunk "_jit_retr")))
(define jit-reti
  (get-ffi-obj
   "_jit_reti"
   lightning-lib
   (_fun _jit_state_t* _jit_word_t -> _void)
   (get-error-thunk "_jit_reti")))
(define jit-retval-c
  (get-ffi-obj
   "_jit_retval_c"
   lightning-lib
   (_fun _jit_state_t* _jit_gpr_t -> _void)
   (get-error-thunk "_jit_retval_c")))
(define jit-retval-uc
  (get-ffi-obj
   "_jit_retval_uc"
   lightning-lib
   (_fun _jit_state_t* _jit_gpr_t -> _void)
   (get-error-thunk "_jit_retval_uc")))
(define jit-retval-s
  (get-ffi-obj
   "_jit_retval_s"
   lightning-lib
   (_fun _jit_state_t* _jit_gpr_t -> _void)
   (get-error-thunk "_jit_retval_s")))
(define jit-retval-us
  (get-ffi-obj
   "_jit_retval_us"
   lightning-lib
   (_fun _jit_state_t* _jit_gpr_t -> _void)
   (get-error-thunk "_jit_retval_us")))
(define jit-retval-i
  (get-ffi-obj
   "_jit_retval_i"
   lightning-lib
   (_fun _jit_state_t* _jit_gpr_t -> _void)
   (get-error-thunk "_jit_retval_i")))
(define jit-retval-ui
  (get-ffi-obj
   "_jit_retval_ui"
   lightning-lib
   (_fun _jit_state_t* _jit_gpr_t -> _void)
   (get-error-thunk "_jit_retval_ui")))
(define jit-retval-l
  (get-ffi-obj
   "_jit_retval_l"
   lightning-lib
   (_fun _jit_state_t* _jit_gpr_t -> _void)
   (get-error-thunk "_jit_retval_l")))
(define jit-epilog
  (get-ffi-obj
   "_jit_epilog"
   lightning-lib
   (_fun _jit_state_t* -> _void)
   (get-error-thunk "_jit_epilog")))
(define jit-patch
  (get-ffi-obj
   "_jit_patch"
   lightning-lib
   (_fun _jit_state_t* _jit_node_t* -> _void)
   (get-error-thunk "_jit_patch")))
(define jit-patch-at
  (get-ffi-obj
   "_jit_patch_at"
   lightning-lib
   (_fun _jit_state_t* _jit_node_t* _jit_node_t* -> _void)
   (get-error-thunk "_jit_patch_at")))
(define jit-patch-abs
  (get-ffi-obj
   "_jit_patch_abs"
   lightning-lib
   (_fun _jit_state_t* _jit_node_t* _jit_pointer_t -> _void)
   (get-error-thunk "_jit_patch_abs")))
(define jit-realize
  (get-ffi-obj
   "_jit_realize"
   lightning-lib
   (_fun _jit_state_t* -> _void)
   (get-error-thunk "_jit_realize")))
(define jit-get-code
  (get-ffi-obj
   "_jit_get_code"
   lightning-lib
   (_fun _jit_state_t* _jit_word_t* -> _jit_pointer_t)
   (get-error-thunk "_jit_get_code")))
(define jit-set-code
  (get-ffi-obj
   "_jit_set_code"
   lightning-lib
   (_fun _jit_state_t* _jit_pointer_t _jit_word_t -> _void)
   (get-error-thunk "_jit_set_code")))
(define jit-get-data
  (get-ffi-obj
   "_jit_get_data"
   lightning-lib
   (_fun _jit_state_t* _jit_word_t* _jit_word_t* -> _jit_pointer_t)
   (get-error-thunk "_jit_get_data")))
(define jit-set-data
  (get-ffi-obj
   "_jit_set_data"
   lightning-lib
   (_fun _jit_state_t* _jit_pointer_t _jit_word_t _jit_word_t -> _void)
   (get-error-thunk "_jit_set_data")))
(define jit-frame
  (get-ffi-obj
   "_jit_frame"
   lightning-lib
   (_fun _jit_state_t* _jit_int32_t -> _void)
   (get-error-thunk "_jit_frame")))
(define jit-tramp
  (get-ffi-obj
   "_jit_tramp"
   lightning-lib
   (_fun _jit_state_t* _jit_int32_t -> _void)
   (get-error-thunk "_jit_tramp")))
(define jit-emit
  (get-ffi-obj
   "_jit_emit"
   lightning-lib
   (_fun _jit_state_t* -> _jit_pointer_t)
   (get-error-thunk "_jit_emit")))
(define jit-print
  (get-ffi-obj
   "_jit_print"
   lightning-lib
   (_fun _jit_state_t* -> _void)
   (get-error-thunk "_jit_print")))
(define jit-arg-f
  (get-ffi-obj
   "_jit_arg_f"
   lightning-lib
   (_fun _jit_state_t* -> _jit_node_t*)
   (get-error-thunk "_jit_arg_f")))
(define jit-getarg-f
  (get-ffi-obj
   "_jit_getarg_f"
   lightning-lib
   (_fun _jit_state_t* _jit_fpr_t _jit_node_t* -> _void)
   (get-error-thunk "_jit_getarg_f")))
(define jit-putargr-f
  (get-ffi-obj
   "_jit_putargr_f"
   lightning-lib
   (_fun _jit_state_t* _jit_fpr_t _jit_node_t* -> _void)
   (get-error-thunk "_jit_putargr_f")))
(define jit-putargi-f
  (get-ffi-obj
   "_jit_putargi_f"
   lightning-lib
   (_fun _jit_state_t* _jit_float32_t _jit_node_t* -> _void)
   (get-error-thunk "_jit_putargi_f")))
(define jit-pushargr-f
  (get-ffi-obj
   "_jit_pushargr_f"
   lightning-lib
   (_fun _jit_state_t* _jit_fpr_t -> _void)
   (get-error-thunk "_jit_pushargr_f")))
(define jit-pushargi-f
  (get-ffi-obj
   "_jit_pushargi_f"
   lightning-lib
   (_fun _jit_state_t* _jit_float32_t -> _void)
   (get-error-thunk "_jit_pushargi_f")))
(define jit-retr-f
  (get-ffi-obj
   "_jit_retr_f"
   lightning-lib
   (_fun _jit_state_t* _jit_fpr_t -> _void)
   (get-error-thunk "_jit_retr_f")))
(define jit-reti-f
  (get-ffi-obj
   "_jit_reti_f"
   lightning-lib
   (_fun _jit_state_t* _jit_float32_t -> _void)
   (get-error-thunk "_jit_reti_f")))
(define jit-retval-f
  (get-ffi-obj
   "_jit_retval_f"
   lightning-lib
   (_fun _jit_state_t* _jit_fpr_t -> _void)
   (get-error-thunk "_jit_retval_f")))
(define jit-arg-d
  (get-ffi-obj
   "_jit_arg_d"
   lightning-lib
   (_fun _jit_state_t* -> _jit_node_t*)
   (get-error-thunk "_jit_arg_d")))
(define jit-getarg-d
  (get-ffi-obj
   "_jit_getarg_d"
   lightning-lib
   (_fun _jit_state_t* _jit_fpr_t _jit_node_t* -> _void)
   (get-error-thunk "_jit_getarg_d")))
(define jit-putargr-d
  (get-ffi-obj
   "_jit_putargr_d"
   lightning-lib
   (_fun _jit_state_t* _jit_fpr_t _jit_node_t* -> _void)
   (get-error-thunk "_jit_putargr_d")))
(define jit-putargi-d
  (get-ffi-obj
   "_jit_putargi_d"
   lightning-lib
   (_fun _jit_state_t* _jit_float64_t _jit_node_t* -> _void)
   (get-error-thunk "_jit_putargi_d")))
(define jit-pushargr-d
  (get-ffi-obj
   "_jit_pushargr_d"
   lightning-lib
   (_fun _jit_state_t* _jit_fpr_t -> _void)
   (get-error-thunk "_jit_pushargr_d")))
(define jit-pushargi-d
  (get-ffi-obj
   "_jit_pushargi_d"
   lightning-lib
   (_fun _jit_state_t* _jit_float64_t -> _void)
   (get-error-thunk "_jit_pushargi_d")))
(define jit-retr-d
  (get-ffi-obj
   "_jit_retr_d"
   lightning-lib
   (_fun _jit_state_t* _jit_fpr_t -> _void)
   (get-error-thunk "_jit_retr_d")))
(define jit-reti-d
  (get-ffi-obj
   "_jit_reti_d"
   lightning-lib
   (_fun _jit_state_t* _jit_float64_t -> _void)
   (get-error-thunk "_jit_reti_d")))
(define jit-retval-d
  (get-ffi-obj
   "_jit_retval_d"
   lightning-lib
   (_fun _jit_state_t* _jit_fpr_t -> _void)
   (get-error-thunk "_jit_retval_d")))
(define jit-new-node
  (get-ffi-obj
   "_jit_new_node"
   lightning-lib
   (_fun _jit_state_t* _jit_code_t -> _jit_node_t*)
   (get-error-thunk "_jit_new_node")))
(define jit-new-node-w
  (get-ffi-obj
   "_jit_new_node_w"
   lightning-lib
   (_fun _jit_state_t* _jit_code_t _jit_word_t -> _jit_node_t*)
   (get-error-thunk "_jit_new_node_w")))
(define jit-new-node-p
  (get-ffi-obj
   "_jit_new_node_p"
   lightning-lib
   (_fun _jit_state_t* _jit_code_t _jit_pointer_t -> _jit_node_t*)
   (get-error-thunk "_jit_new_node_p")))
(define jit-new-node-ww
  (get-ffi-obj
   "_jit_new_node_ww"
   lightning-lib
   (_fun _jit_state_t* _jit_code_t _jit_word_t _jit_word_t -> _jit_node_t*)
   (get-error-thunk "_jit_new_node_ww")))
(define jit-new-node-wp
  (get-ffi-obj
   "_jit_new_node_wp"
   lightning-lib
   (_fun
    _jit_state_t*
    _jit_code_t
    _jit_word_t
    _jit_pointer_t
    ->
    _jit_node_t*)
   (get-error-thunk "_jit_new_node_wp")))
(define jit-new-node-pw
  (get-ffi-obj
   "_jit_new_node_pw"
   lightning-lib
   (_fun
    _jit_state_t*
    _jit_code_t
    _jit_pointer_t
    _jit_word_t
    ->
    _jit_node_t*)
   (get-error-thunk "_jit_new_node_pw")))
(define jit-new-node-wf
  (get-ffi-obj
   "_jit_new_node_wf"
   lightning-lib
   (_fun
    _jit_state_t*
    _jit_code_t
    _jit_word_t
    _jit_float32_t
    ->
    _jit_node_t*)
   (get-error-thunk "_jit_new_node_wf")))
(define jit-new-node-wd
  (get-ffi-obj
   "_jit_new_node_wd"
   lightning-lib
   (_fun
    _jit_state_t*
    _jit_code_t
    _jit_word_t
    _jit_float64_t
    ->
    _jit_node_t*)
   (get-error-thunk "_jit_new_node_wd")))
(define jit-new-node-www
  (get-ffi-obj
   "_jit_new_node_www"
   lightning-lib
   (_fun
    _jit_state_t*
    _jit_code_t
    _jit_word_t
    _jit_word_t
    _jit_word_t
    ->
    _jit_node_t*)
   (get-error-thunk "_jit_new_node_www")))
(define jit-new-node-qww
  (get-ffi-obj
   "_jit_new_node_qww"
   lightning-lib
   (_fun
    _jit_state_t*
    _jit_code_t
    _jit_int32_t
    _jit_int32_t
    _jit_word_t
    _jit_word_t
    ->
    _jit_node_t*)
   (get-error-thunk "_jit_new_node_qww")))
(define jit-new-node-wwf
  (get-ffi-obj
   "_jit_new_node_wwf"
   lightning-lib
   (_fun
    _jit_state_t*
    _jit_code_t
    _jit_word_t
    _jit_word_t
    _jit_float32_t
    ->
    _jit_node_t*)
   (get-error-thunk "_jit_new_node_wwf")))
(define jit-new-node-wwd
  (get-ffi-obj
   "_jit_new_node_wwd"
   lightning-lib
   (_fun
    _jit_state_t*
    _jit_code_t
    _jit_word_t
    _jit_word_t
    _jit_float64_t
    ->
    _jit_node_t*)
   (get-error-thunk "_jit_new_node_wwd")))
(define jit-new-node-pww
  (get-ffi-obj
   "_jit_new_node_pww"
   lightning-lib
   (_fun
    _jit_state_t*
    _jit_code_t
    _jit_pointer_t
    _jit_word_t
    _jit_word_t
    ->
    _jit_node_t*)
   (get-error-thunk "_jit_new_node_pww")))
(define jit-new-node-pwf
  (get-ffi-obj
   "_jit_new_node_pwf"
   lightning-lib
   (_fun
    _jit_state_t*
    _jit_code_t
    _jit_pointer_t
    _jit_word_t
    _jit_float32_t
    ->
    _jit_node_t*)
   (get-error-thunk "_jit_new_node_pwf")))
(define jit-new-node-pwd
  (get-ffi-obj
   "_jit_new_node_pwd"
   lightning-lib
   (_fun
    _jit_state_t*
    _jit_code_t
    _jit_pointer_t
    _jit_word_t
    _jit_float64_t
    ->
    _jit_node_t*)
   (get-error-thunk "_jit_new_node_pwd")))
(define jit-arg-register-p
  (get-ffi-obj
   "_jit_arg_register_p"
   lightning-lib
   (_fun _jit_state_t* _jit_node_t* -> _jit_bool_t)
   (get-error-thunk "_jit_arg_register_p")))
(define jit-callee-save-p
  (get-ffi-obj
   "_jit_callee_save_p"
   lightning-lib
   (_fun _jit_state_t* _jit_int32_t -> _jit_bool_t)
   (get-error-thunk "_jit_callee_save_p")))
(define jit-pointer-p
  (get-ffi-obj
   "_jit_pointer_p"
   lightning-lib
   (_fun _jit_state_t* _jit_pointer_t -> _jit_bool_t)
   (get-error-thunk "_jit_pointer_p")))
(define jit-get-note
  (get-ffi-obj
   "_jit_get_note"
   lightning-lib
   (_fun _jit_state_t* _jit_pointer_t _char** _char** _int* -> _jit_bool_t)
   (get-error-thunk "_jit_get_note")))
(define jit-disassemble
  (get-ffi-obj
   "_jit_disassemble"
   lightning-lib
   (_fun _jit_state_t* -> _void)
   (get-error-thunk "_jit_disassemble")))
(define jit-set-memory-functions
  (get-ffi-obj
   "jit_set_memory_functions"
   lightning-lib
   (_fun
    _jit_alloc_func_ptr
    _jit_realloc_func_ptr
    _jit_free_func_ptr
    ->
    _void)
   (get-error-thunk "jit_set_memory_functions")))
(define jit-get-memory-functions
  (get-ffi-obj
   "jit_get_memory_functions"
   lightning-lib
   (_fun
    _jit_alloc_func_ptr*
    _jit_realloc_func_ptr*
    _jit_free_func_ptr*
    ->
    _void)
   (get-error-thunk "jit_get_memory_functions")))
