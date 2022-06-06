#ifndef AES_8051_INTEGRATOR_H__
#define AES_8051_INTEGRATOR_H__

#include <ilang/ilang++.h>
#include <ilang/ila/instr_lvl_abs.h>
#include <ilang/ila/instr.h>

#define AES_START 0xff00
#define AES_STATE 0xff01
#define AES_ADDR 0xff02
#define AES_LENGTH 0xff04
#define AES_KEY 0xff20
#define AES_CNT 0xff10
#define AES_END 0xff40

#define CMD_NOP 0
#define CMD_READ 1
#define CMD_WRITE 2

#define AES_STATE_IDLE 0
#define AES_STATE_READ_DATA 1
#define AES_STATE_OPERATE 2
#define AES_STATE_WRITE_DATA 3

void AddAESTo8051(const ilang::InstrLvlAbsPtr& model_ptr);

ilang::ExprRef slice_update(const ilang::ExprRef& reg, const ilang::ExprRef& idx,
                     const ilang::ExprRef& input_slice,
                     unsigned long base_addr, unsigned no_slice,
                     unsigned slice_width);

ilang::InstrLvlAbsPtr get_soc_ila(std::string& model_file);

#endif // AES_8051_INTEGRATOR_H__
