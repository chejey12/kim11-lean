// Lean compiler output
// Module: Kim11.Basic
// Imports: public import Init public meta import Init
#include <lean/lean.h>
#if defined(__clang__)
#pragma clang diagnostic ignored "-Wunused-parameter"
#pragma clang diagnostic ignored "-Wunused-label"
#elif defined(__GNUC__) && !defined(__CLANG__)
#pragma GCC diagnostic ignored "-Wunused-parameter"
#pragma GCC diagnostic ignored "-Wunused-label"
#pragma GCC diagnostic ignored "-Wunused-but-set-variable"
#endif
#ifdef __cplusplus
extern "C" {
#endif
lean_object* lean_mk_empty_array_with_capacity(lean_object*);
lean_object* l_List_reverse___redArg(lean_object*);
lean_object* l_List_drop___redArg(lean_object*, lean_object*);
lean_object* l___private_Init_Data_List_Impl_0__List_takeTR_go___redArg(lean_object*, lean_object*, lean_object*, lean_object*);
lean_object* l_List_lengthTR___redArg(lean_object*);
lean_object* lean_nat_sub(lean_object*, lean_object*);
lean_object* lean_nat_add(lean_object*, lean_object*);
lean_object* l_List_range(lean_object*);
uint8_t lean_nat_dec_eq(lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_kim11_Kim11_runs(lean_object*);
static const lean_array_object lp_kim11_List_mapTR_loop___at___00Kim11_FactorsAt_spec__0___redArg___closed__0_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_array_object) + sizeof(void*)*0, .m_other = 0, .m_tag = 246}, .m_size = 0, .m_capacity = 0, .m_data = {}};
static const lean_object* lp_kim11_List_mapTR_loop___at___00Kim11_FactorsAt_spec__0___redArg___closed__0 = (const lean_object*)&lp_kim11_List_mapTR_loop___at___00Kim11_FactorsAt_spec__0___redArg___closed__0_value;
LEAN_EXPORT lean_object* lp_kim11_List_mapTR_loop___at___00Kim11_FactorsAt_spec__0___redArg(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_kim11_List_mapTR_loop___at___00Kim11_FactorsAt_spec__0___redArg___boxed(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_kim11_Kim11_FactorsAt___redArg(lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_kim11_Kim11_FactorsAt___redArg___boxed(lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_kim11_Kim11_FactorsAt(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_kim11_Kim11_FactorsAt___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_kim11_List_mapTR_loop___at___00Kim11_FactorsAt_spec__0(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_kim11_List_mapTR_loop___at___00Kim11_FactorsAt_spec__0___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_kim11_Kim11_runs(lean_object* v_x_1_){
_start:
{
if (lean_obj_tag(v_x_1_) == 0)
{
return v_x_1_;
}
else
{
lean_object* v_tail_2_; 
v_tail_2_ = lean_ctor_get(v_x_1_, 1);
lean_inc(v_tail_2_);
if (lean_obj_tag(v_tail_2_) == 0)
{
lean_object* v___x_4_; uint8_t v_isShared_5_; uint8_t v_isSharedCheck_10_; 
v_isSharedCheck_10_ = !lean_is_exclusive(v_x_1_);
if (v_isSharedCheck_10_ == 0)
{
lean_object* v_unused_11_; lean_object* v_unused_12_; 
v_unused_11_ = lean_ctor_get(v_x_1_, 1);
lean_dec(v_unused_11_);
v_unused_12_ = lean_ctor_get(v_x_1_, 0);
lean_dec(v_unused_12_);
v___x_4_ = v_x_1_;
v_isShared_5_ = v_isSharedCheck_10_;
goto v_resetjp_3_;
}
else
{
lean_dec(v_x_1_);
v___x_4_ = lean_box(0);
v_isShared_5_ = v_isSharedCheck_10_;
goto v_resetjp_3_;
}
v_resetjp_3_:
{
lean_object* v___x_6_; lean_object* v___x_8_; 
v___x_6_ = lean_unsigned_to_nat(1u);
if (v_isShared_5_ == 0)
{
lean_ctor_set(v___x_4_, 0, v___x_6_);
v___x_8_ = v___x_4_;
goto v_reusejp_7_;
}
else
{
lean_object* v_reuseFailAlloc_9_; 
v_reuseFailAlloc_9_ = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(v_reuseFailAlloc_9_, 0, v___x_6_);
lean_ctor_set(v_reuseFailAlloc_9_, 1, v_tail_2_);
v___x_8_ = v_reuseFailAlloc_9_;
goto v_reusejp_7_;
}
v_reusejp_7_:
{
return v___x_8_;
}
}
}
else
{
lean_object* v_head_13_; lean_object* v___x_15_; uint8_t v_isShared_16_; uint8_t v_isSharedCheck_36_; 
v_head_13_ = lean_ctor_get(v_x_1_, 0);
v_isSharedCheck_36_ = !lean_is_exclusive(v_x_1_);
if (v_isSharedCheck_36_ == 0)
{
lean_object* v_unused_37_; 
v_unused_37_ = lean_ctor_get(v_x_1_, 1);
lean_dec(v_unused_37_);
v___x_15_ = v_x_1_;
v_isShared_16_ = v_isSharedCheck_36_;
goto v_resetjp_14_;
}
else
{
lean_inc(v_head_13_);
lean_dec(v_x_1_);
v___x_15_ = lean_box(0);
v_isShared_16_ = v_isSharedCheck_36_;
goto v_resetjp_14_;
}
v_resetjp_14_:
{
lean_object* v_head_17_; uint8_t v___x_18_; 
v_head_17_ = lean_ctor_get(v_tail_2_, 0);
v___x_18_ = lean_nat_dec_eq(v_head_13_, v_head_17_);
lean_dec(v_head_13_);
if (v___x_18_ == 0)
{
lean_object* v___x_19_; lean_object* v___x_20_; lean_object* v___x_22_; 
v___x_19_ = lean_unsigned_to_nat(1u);
v___x_20_ = lp_kim11_Kim11_runs(v_tail_2_);
if (v_isShared_16_ == 0)
{
lean_ctor_set(v___x_15_, 1, v___x_20_);
lean_ctor_set(v___x_15_, 0, v___x_19_);
v___x_22_ = v___x_15_;
goto v_reusejp_21_;
}
else
{
lean_object* v_reuseFailAlloc_23_; 
v_reuseFailAlloc_23_ = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(v_reuseFailAlloc_23_, 0, v___x_19_);
lean_ctor_set(v_reuseFailAlloc_23_, 1, v___x_20_);
v___x_22_ = v_reuseFailAlloc_23_;
goto v_reusejp_21_;
}
v_reusejp_21_:
{
return v___x_22_;
}
}
else
{
lean_object* v___x_24_; 
lean_del_object(v___x_15_);
v___x_24_ = lp_kim11_Kim11_runs(v_tail_2_);
if (lean_obj_tag(v___x_24_) == 0)
{
return v___x_24_;
}
else
{
lean_object* v_head_25_; lean_object* v_tail_26_; lean_object* v___x_28_; uint8_t v_isShared_29_; uint8_t v_isSharedCheck_35_; 
v_head_25_ = lean_ctor_get(v___x_24_, 0);
v_tail_26_ = lean_ctor_get(v___x_24_, 1);
v_isSharedCheck_35_ = !lean_is_exclusive(v___x_24_);
if (v_isSharedCheck_35_ == 0)
{
v___x_28_ = v___x_24_;
v_isShared_29_ = v_isSharedCheck_35_;
goto v_resetjp_27_;
}
else
{
lean_inc(v_tail_26_);
lean_inc(v_head_25_);
lean_dec(v___x_24_);
v___x_28_ = lean_box(0);
v_isShared_29_ = v_isSharedCheck_35_;
goto v_resetjp_27_;
}
v_resetjp_27_:
{
lean_object* v___x_30_; lean_object* v___x_31_; lean_object* v___x_33_; 
v___x_30_ = lean_unsigned_to_nat(1u);
v___x_31_ = lean_nat_add(v_head_25_, v___x_30_);
lean_dec(v_head_25_);
if (v_isShared_29_ == 0)
{
lean_ctor_set(v___x_28_, 0, v___x_31_);
v___x_33_ = v___x_28_;
goto v_reusejp_32_;
}
else
{
lean_object* v_reuseFailAlloc_34_; 
v_reuseFailAlloc_34_ = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(v_reuseFailAlloc_34_, 0, v___x_31_);
lean_ctor_set(v_reuseFailAlloc_34_, 1, v_tail_26_);
v___x_33_ = v_reuseFailAlloc_34_;
goto v_reusejp_32_;
}
v_reusejp_32_:
{
return v___x_33_;
}
}
}
}
}
}
}
}
}
LEAN_EXPORT lean_object* lp_kim11_List_mapTR_loop___at___00Kim11_FactorsAt_spec__0___redArg(lean_object* v_w_40_, lean_object* v_k_41_, lean_object* v_a_42_, lean_object* v_a_43_){
_start:
{
if (lean_obj_tag(v_a_42_) == 0)
{
lean_object* v___x_44_; 
lean_dec(v_k_41_);
v___x_44_ = l_List_reverse___redArg(v_a_43_);
return v___x_44_;
}
else
{
lean_object* v_head_45_; lean_object* v_tail_46_; lean_object* v___x_48_; uint8_t v_isShared_49_; uint8_t v_isSharedCheck_57_; 
v_head_45_ = lean_ctor_get(v_a_42_, 0);
v_tail_46_ = lean_ctor_get(v_a_42_, 1);
v_isSharedCheck_57_ = !lean_is_exclusive(v_a_42_);
if (v_isSharedCheck_57_ == 0)
{
v___x_48_ = v_a_42_;
v_isShared_49_ = v_isSharedCheck_57_;
goto v_resetjp_47_;
}
else
{
lean_inc(v_tail_46_);
lean_inc(v_head_45_);
lean_dec(v_a_42_);
v___x_48_ = lean_box(0);
v_isShared_49_ = v_isSharedCheck_57_;
goto v_resetjp_47_;
}
v_resetjp_47_:
{
lean_object* v___x_50_; lean_object* v___x_51_; lean_object* v___x_52_; lean_object* v___x_54_; 
v___x_50_ = l_List_drop___redArg(v_head_45_, v_w_40_);
v___x_51_ = ((lean_object*)(lp_kim11_List_mapTR_loop___at___00Kim11_FactorsAt_spec__0___redArg___closed__0));
lean_inc(v_k_41_);
lean_inc(v___x_50_);
v___x_52_ = l___private_Init_Data_List_Impl_0__List_takeTR_go___redArg(v___x_50_, v___x_50_, v_k_41_, v___x_51_);
lean_dec(v___x_50_);
if (v_isShared_49_ == 0)
{
lean_ctor_set(v___x_48_, 1, v_a_43_);
lean_ctor_set(v___x_48_, 0, v___x_52_);
v___x_54_ = v___x_48_;
goto v_reusejp_53_;
}
else
{
lean_object* v_reuseFailAlloc_56_; 
v_reuseFailAlloc_56_ = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(v_reuseFailAlloc_56_, 0, v___x_52_);
lean_ctor_set(v_reuseFailAlloc_56_, 1, v_a_43_);
v___x_54_ = v_reuseFailAlloc_56_;
goto v_reusejp_53_;
}
v_reusejp_53_:
{
v_a_42_ = v_tail_46_;
v_a_43_ = v___x_54_;
goto _start;
}
}
}
}
}
LEAN_EXPORT lean_object* lp_kim11_List_mapTR_loop___at___00Kim11_FactorsAt_spec__0___redArg___boxed(lean_object* v_w_58_, lean_object* v_k_59_, lean_object* v_a_60_, lean_object* v_a_61_){
_start:
{
lean_object* v_res_62_; 
v_res_62_ = lp_kim11_List_mapTR_loop___at___00Kim11_FactorsAt_spec__0___redArg(v_w_58_, v_k_59_, v_a_60_, v_a_61_);
lean_dec(v_w_58_);
return v_res_62_;
}
}
LEAN_EXPORT lean_object* lp_kim11_Kim11_FactorsAt___redArg(lean_object* v_w_63_, lean_object* v_k_64_){
_start:
{
lean_object* v___x_65_; lean_object* v___x_66_; lean_object* v___x_67_; lean_object* v___x_68_; lean_object* v___x_69_; lean_object* v___x_70_; lean_object* v___x_71_; 
v___x_65_ = l_List_lengthTR___redArg(v_w_63_);
v___x_66_ = lean_nat_sub(v___x_65_, v_k_64_);
lean_dec(v___x_65_);
v___x_67_ = lean_unsigned_to_nat(1u);
v___x_68_ = lean_nat_add(v___x_66_, v___x_67_);
lean_dec(v___x_66_);
v___x_69_ = l_List_range(v___x_68_);
v___x_70_ = lean_box(0);
v___x_71_ = lp_kim11_List_mapTR_loop___at___00Kim11_FactorsAt_spec__0___redArg(v_w_63_, v_k_64_, v___x_69_, v___x_70_);
return v___x_71_;
}
}
LEAN_EXPORT lean_object* lp_kim11_Kim11_FactorsAt___redArg___boxed(lean_object* v_w_72_, lean_object* v_k_73_){
_start:
{
lean_object* v_res_74_; 
v_res_74_ = lp_kim11_Kim11_FactorsAt___redArg(v_w_72_, v_k_73_);
lean_dec(v_w_72_);
return v_res_74_;
}
}
LEAN_EXPORT lean_object* lp_kim11_Kim11_FactorsAt(lean_object* v_00_u03b1_75_, lean_object* v_w_76_, lean_object* v_k_77_){
_start:
{
lean_object* v___x_78_; 
v___x_78_ = lp_kim11_Kim11_FactorsAt___redArg(v_w_76_, v_k_77_);
return v___x_78_;
}
}
LEAN_EXPORT lean_object* lp_kim11_Kim11_FactorsAt___boxed(lean_object* v_00_u03b1_79_, lean_object* v_w_80_, lean_object* v_k_81_){
_start:
{
lean_object* v_res_82_; 
v_res_82_ = lp_kim11_Kim11_FactorsAt(v_00_u03b1_79_, v_w_80_, v_k_81_);
lean_dec(v_w_80_);
return v_res_82_;
}
}
LEAN_EXPORT lean_object* lp_kim11_List_mapTR_loop___at___00Kim11_FactorsAt_spec__0(lean_object* v_00_u03b1_83_, lean_object* v_w_84_, lean_object* v_k_85_, lean_object* v_a_86_, lean_object* v_a_87_){
_start:
{
lean_object* v___x_88_; 
v___x_88_ = lp_kim11_List_mapTR_loop___at___00Kim11_FactorsAt_spec__0___redArg(v_w_84_, v_k_85_, v_a_86_, v_a_87_);
return v___x_88_;
}
}
LEAN_EXPORT lean_object* lp_kim11_List_mapTR_loop___at___00Kim11_FactorsAt_spec__0___boxed(lean_object* v_00_u03b1_89_, lean_object* v_w_90_, lean_object* v_k_91_, lean_object* v_a_92_, lean_object* v_a_93_){
_start:
{
lean_object* v_res_94_; 
v_res_94_ = lp_kim11_List_mapTR_loop___at___00Kim11_FactorsAt_spec__0(v_00_u03b1_89_, v_w_90_, v_k_91_, v_a_92_, v_a_93_);
lean_dec(v_w_90_);
return v_res_94_;
}
}
lean_object* initialize_Init(uint8_t builtin);
lean_object* initialize_Init(uint8_t builtin);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_kim11_Kim11_Basic(uint8_t builtin) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
res = initialize_Init(builtin);
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Init(builtin);
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
