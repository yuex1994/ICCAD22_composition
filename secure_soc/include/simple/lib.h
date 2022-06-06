// lib.h
// Synopsis: the header of the simple library

#ifndef SIMPLE_LIB_H__
#define SIMPLE_LIB_H__
#include <ilang/ila/instr_lvl_abs.h>
#include <ilang/ila/ast_hub.h>
using namespace ilang;

void AddIromInputPort(const InstrLvlAbsPtr& model_ptr);
void AddXramOutPort(const InstrLvlAbsPtr &model_ptr);
void Model8051RemapMemInterface(const InstrLvlAbsPtr& model_ptr, std::vector<ExprPtr>& tmp_iram_elements, int instr_num);
void DfsFromRomToPort(const ExprPtr& expr, const InstrLvlAbsPtr& model_ptr);
void DfsFromIramToPort(const ExprPtr& expr, const InstrLvlAbsPtr& model_ptr, std::vector<ExprPtr>& iram);

void ModifyIramInterface(const InstrLvlAbsPtr& model_ptr, std::vector<ExprPtr>& iram);
void ModifyIramLoad(const ExprPtr& parent_expr, int parent_index, const InstrLvlAbsPtr& model_ptr, std::vector<ExprPtr>& iram);
void ModifyIramStore(const ExprPtr& expr, const InstrLvlAbsPtr& model_ptr, const InstrPtr& instr_ptr, std::vector<ExprPtr>& iram); 
void ModifyXramWrState(const InstrLvlAbsPtr &model_ptr, const InstrPtr &instr_ptr);
void ModifyDecodeWithValid(const InstrLvlAbsPtr &model_ptr);
void AddHandshakeInstr(const InstrLvlAbsPtr &model_ptr);



// void ClearIramStore(const InstrLvlAbsPtr& model_ptr, int instr_idx, std::vector<ExprPtr>& tmp_iram_elements);
// void ChangeUpdateFuncFromRomToPort(const ExprPtr& updated_state, const InstrPtr& instr, const InstrLvlAbsPtr& model_ptr); 
#endif // SIMPLE_LIB_H__

