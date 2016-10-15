#lang racket

(require ffi/unsafe)
(define lightning-lib (ffi-lib "liblightning"))

(define _void* _pointer);(_cpointer 'void* _pointer)

(define _jit_free_func_ptr (_fun  _void* -> _void))
(define _jit_free_func_ptr* _pointer)

(define _jit_realloc_func_ptr (_fun _void* _size -> _void*))
(define _jit_realloc_func_ptr* _pointer)

(define _jit_alloc_func_ptr (_fun _size -> _void*))
(define _jit_alloc_func_ptr* _pointer)

(define _jit_state_t* _pointer)

(define _jit_bool_t _int32)
(define _jit_int32_t _int32)
(define _jit_gpr_t _int32)
(define _jit_fpr_t _int32)

(define _jit_word_t (if (equal? (system-type 'word) 32) _int32 _int64))

(define _jit_float32_t _float)
(define _jit_float64_t _double)

(define _int _int32)
(define _int* _pointer)

(define _jit_pointer_t _pointer)
(define _const_char* _pointer)
(define _jit_node_t* _pointer)
(define _jit_word_t* _pointer)
(define _char** _pointer)

(define _jit_code_t
  (_enum '(
           jit_code_data
           jit_code_live
           jit_code_align
           jit_code_save
           jit_code_load
           jit_code_name
           jit_code_note
           jit_code_label
           jit_code_prolog
           jit_code_ellipsis
           jit_code_allocai
           jit_code_allocar
           jit_code_arg
           jit_code_getarg_c
           jit_code_getarg_uc
           jit_code_getarg_s
           jit_code_getarg_us
           jit_code_getarg_i
           jit_code_getarg_ui
           jit_code_getarg_l
           jit_code_putargr
           jit_code_putargi
           jit_code_va_start
           jit_code_va_arg
           jit_code_va_arg_d
           jit_code_va_end
           jit_code_addr
           jit_code_addi
           jit_code_addcr
           jit_code_addci
           jit_code_addxr
           jit_code_addxi
           jit_code_subr
           jit_code_subi
           jit_code_subcr
           jit_code_subci
           jit_code_subxr
           jit_code_subxi
           jit_code_rsbi
           jit_code_mulr
           jit_code_muli
           jit_code_qmulr
           jit_code_qmuli
           jit_code_qmulr_u
           jit_code_qmuli_u
           jit_code_divr
           jit_code_divi
           jit_code_divr_u
           jit_code_divi_u
           jit_code_qdivr
           jit_code_qdivi
           jit_code_qdivr_u
           jit_code_qdivi_u
           jit_code_remr
           jit_code_remi
           jit_code_remr_u
           jit_code_remi_u
           jit_code_andr
           jit_code_andi
           jit_code_orr
           jit_code_ori
           jit_code_xorr
           jit_code_xori
           jit_code_lshr
           jit_code_lshi
           jit_code_rshr
           jit_code_rshi
           jit_code_rshr_u
           jit_code_rshi_u
           jit_code_negr
           jit_code_comr
           jit_code_ltr
           jit_code_lti
           jit_code_ltr_u
           jit_code_lti_u
           jit_code_ler
           jit_code_lei
           jit_code_ler_u
           jit_code_lei_u
           jit_code_eqr
           jit_code_eqi
           jit_code_ger
           jit_code_gei
           jit_code_ger_u
           jit_code_gei_u
           jit_code_gtr
           jit_code_gti
           jit_code_gtr_u
           jit_code_gti_u
           jit_code_ner
           jit_code_nei
           jit_code_movr
           jit_code_movi
           jit_code_extr_c
           jit_code_extr_uc
           jit_code_extr_s
           jit_code_extr_us
           jit_code_extr_i
           jit_code_extr_ui
           jit_code_htonr_us
           jit_code_htonr_ui
           jit_code_htonr_ul
           jit_code_ldr_c
           jit_code_ldi_c
           jit_code_ldr_uc
           jit_code_ldi_uc
           jit_code_ldr_s
           jit_code_ldi_s
           jit_code_ldr_us
           jit_code_ldi_us
           jit_code_ldr_i
           jit_code_ldi_i
           jit_code_ldr_ui
           jit_code_ldi_ui
           jit_code_ldr_l
           jit_code_ldi_l
           jit_code_ldxr_c
           jit_code_ldxi_c
           jit_code_ldxr_uc
           jit_code_ldxi_uc
           jit_code_ldxr_s
           jit_code_ldxi_s
           jit_code_ldxr_us
           jit_code_ldxi_us
           jit_code_ldxr_i
           jit_code_ldxi_i
           jit_code_ldxr_ui
           jit_code_ldxi_ui
           jit_code_ldxr_l
           jit_code_ldxi_l
           jit_code_str_c
           jit_code_sti_c
           jit_code_str_s
           jit_code_sti_s
           jit_code_str_i
           jit_code_sti_i
           jit_code_str_l
           jit_code_sti_l
           jit_code_stxr_c
           jit_code_stxi_c
           jit_code_stxr_s
           jit_code_stxi_s
           jit_code_stxr_i
           jit_code_stxi_i
           jit_code_stxr_l
           jit_code_stxi_l
           jit_code_bltr
           jit_code_blti
           jit_code_bltr_u
           jit_code_blti_u
           jit_code_bler
           jit_code_blei
           jit_code_bler_u
           jit_code_blei_u
           jit_code_beqr
           jit_code_beqi
           jit_code_bger
           jit_code_bgei
           jit_code_bger_u
           jit_code_bgei_u
           jit_code_bgtr
           jit_code_bgti
           jit_code_bgtr_u
           jit_code_bgti_u
           jit_code_bner
           jit_code_bnei
           jit_code_bmsr
           jit_code_bmsi
           jit_code_bmcr
           jit_code_bmci
           jit_code_boaddr
           jit_code_boaddi
           jit_code_boaddr_u
           jit_code_boaddi_u
           jit_code_bxaddr
           jit_code_bxaddi
           jit_code_bxaddr_u
           jit_code_bxaddi_u
           jit_code_bosubr
           jit_code_bosubi
           jit_code_bosubr_u
           jit_code_bosubi_u
           jit_code_bxsubr
           jit_code_bxsubi
           jit_code_bxsubr_u
           jit_code_bxsubi_u
           jit_code_jmpr
           jit_code_jmpi
           jit_code_callr
           jit_code_calli
           jit_code_prepare
           jit_code_pushargr
           jit_code_pushargi
           jit_code_finishr
           jit_code_finishi
           jit_code_ret
           jit_code_retr
           jit_code_reti
           jit_code_retval_c
           jit_code_retval_uc
           jit_code_retval_s
           jit_code_retval_us
           jit_code_retval_i
           jit_code_retval_ui
           jit_code_retval_l
           jit_code_epilog
           jit_code_arg_f
           jit_code_getarg_f
           jit_code_putargr_f
           jit_code_putargi_f
           jit_code_addr_f
           jit_code_addi_f
           jit_code_subr_f
           jit_code_subi_f
           jit_code_rsbi_f
           jit_code_mulr_f
           jit_code_muli_f
           jit_code_divr_f
           jit_code_divi_f
           jit_code_negr_f
           jit_code_absr_f
           jit_code_sqrtr_f
           jit_code_ltr_f
           jit_code_lti_f
           jit_code_ler_f
           jit_code_lei_f
           jit_code_eqr_f
           jit_code_eqi_f
           jit_code_ger_f
           jit_code_gei_f
           jit_code_gtr_f
           jit_code_gti_f
           jit_code_ner_f
           jit_code_nei_f
           jit_code_unltr_f
           jit_code_unlti_f
           jit_code_unler_f
           jit_code_unlei_f
           jit_code_uneqr_f
           jit_code_uneqi_f
           jit_code_unger_f
           jit_code_ungei_f
           jit_code_ungtr_f
           jit_code_ungti_f
           jit_code_ltgtr_f
           jit_code_ltgti_f
           jit_code_ordr_f
           jit_code_ordi_f
           jit_code_unordr_f
           jit_code_unordi_f
           jit_code_truncr_f_i
           jit_code_truncr_f_l
           jit_code_extr_f
           jit_code_extr_d_f
           jit_code_movr_f
           jit_code_movi_f
           jit_code_ldr_f
           jit_code_ldi_f
           jit_code_ldxr_f
           jit_code_ldxi_f
           jit_code_str_f
           jit_code_sti_f
           jit_code_stxr_f
           jit_code_stxi_f
           jit_code_bltr_f
           jit_code_blti_f
           jit_code_bler_f
           jit_code_blei_f
           jit_code_beqr_f
           jit_code_beqi_f
           jit_code_bger_f
           jit_code_bgei_f
           jit_code_bgtr_f
           jit_code_bgti_f
           jit_code_bner_f
           jit_code_bnei_f
           jit_code_bunltr_f
           jit_code_bunlti_f
           jit_code_bunler_f
           jit_code_bunlei_f
           jit_code_buneqr_f
           jit_code_buneqi_f
           jit_code_bunger_f
           jit_code_bungei_f
           jit_code_bungtr_f
           jit_code_bungti_f
           jit_code_bltgtr_f
           jit_code_bltgti_f
           jit_code_bordr_f
           jit_code_bordi_f
           jit_code_bunordr_f
           jit_code_bunordi_f
           jit_code_pushargr_f
           jit_code_pushargi_f
           jit_code_retr_f
           jit_code_reti_f
           jit_code_retval_f
           jit_code_arg_d
           jit_code_getarg_d
           jit_code_putargr_d
           jit_code_putargi_d
           jit_code_addr_d
           jit_code_addi_d
           jit_code_subr_d
           jit_code_subi_d
           jit_code_rsbi_d
           jit_code_mulr_d
           jit_code_muli_d
           jit_code_divr_d
           jit_code_divi_d
           jit_code_negr_d
           jit_code_absr_d
           jit_code_sqrtr_d
           jit_code_ltr_d
           jit_code_lti_d
           jit_code_ler_d
           jit_code_lei_d
           jit_code_eqr_d
           jit_code_eqi_d
           jit_code_ger_d
           jit_code_gei_d
           jit_code_gtr_d
           jit_code_gti_d
           jit_code_ner_d
           jit_code_nei_d
           jit_code_unltr_d
           jit_code_unlti_d
           jit_code_unler_d
           jit_code_unlei_d
           jit_code_uneqr_d
           jit_code_uneqi_d
           jit_code_unger_d
           jit_code_ungei_d
           jit_code_ungtr_d
           jit_code_ungti_d
           jit_code_ltgtr_d
           jit_code_ltgti_d
           jit_code_ordr_d
           jit_code_ordi_d
           jit_code_unordr_d
           jit_code_unordi_d
           jit_code_truncr_d_i
           jit_code_truncr_d_l
           jit_code_extr_d
           jit_code_extr_f_d
           jit_code_movr_d
           jit_code_movi_d
           jit_code_ldr_d
           jit_code_ldi_d
           jit_code_ldxr_d
           jit_code_ldxi_d
           jit_code_str_d
           jit_code_sti_d
           jit_code_stxr_d
           jit_code_stxi_d
           jit_code_bltr_d
           jit_code_blti_d
           jit_code_bler_d
           jit_code_blei_d
           jit_code_beqr_d
           jit_code_beqi_d
           jit_code_bger_d
           jit_code_bgei_d
           jit_code_bgtr_d
           jit_code_bgti_d
           jit_code_bner_d
           jit_code_bnei_d
           jit_code_bunltr_d
           jit_code_bunlti_d
           jit_code_bunler_d
           jit_code_bunlei_d
           jit_code_buneqr_d
           jit_code_buneqi_d
           jit_code_bunger_d
           jit_code_bungei_d
           jit_code_bungtr_d
           jit_code_bungti_d
           jit_code_bltgtr_d
           jit_code_bltgti_d
           jit_code_bordr_d
           jit_code_bordi_d
           jit_code_bunordr_d
           jit_code_bunordi_d
           jit_code_pushargr_d
           jit_code_pushargi_d
           jit_code_retr_d
           jit_code_reti_d
           jit_code_retval_d
           jit_code_movr_w_f
           jit_code_movr_ww_d
           jit_code_movr_w_d
           jit_code_movr_f_w
           jit_code_movi_f_w
           jit_code_movr_d_ww
           jit_code_movi_d_ww
           jit_code_movr_d_w
           jit_code_movi_d_w
           jit_code_last_code)))


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
   (_fun -> _void)
   (get-error-thunk "finish_jit")))
(define jit-new-state
  (get-ffi-obj
   "jit_new_state"
   lightning-lib
   (_fun -> _jit_state_t*)
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
