#include <ilang/ila/instr_lvl_abs.h>
#include <ilang/ila/ast_hub.h>
#include <ilang/ila/ast/expr.h>
#include <nlohmann/json.hpp>
#include <ilang/ila-mngr/v_eq_check_refinement.h>



typedef std::map<std::string, ilang::InstrLvlAbsPtr> IlaMap;
typedef std::set<ilang::ExprPtr> CustExprSet;

CustExprSet compute_top_input(IlaMap& ila_map, nlohmann::json& comp_map);
void merge_state_input(ilang::InstrLvlAbsPtr m1, std::string s_name, ilang::InstrLvlAbsPtr m2, std::string i_name);
void switch_expr(ilang::ExprPtr e, ilang::ExprPtr new_e, ilang::ExprPtr old_e);
void switch_expr_in_ila(ilang::InstrLvlAbsPtr m, ilang::ExprPtr new_e, ilang::ExprPtr old_e);
ilang::RefPtr RefineHL(const ilang::InstrLvlAbsPtr hl_ila, const std::string &instr_name);
ilang::ExprPtr iter_ila_hier_decode_and_valid(ilang::InstrLvlAbsPtr top);
ilang::RefPtr RefineComp(const ilang::InstrLvlAbsPtr comp_ila, const std::string &instr_name);
ilang::RelPtr GetRelation(const ilang::InstrLvlAbsPtr m1, const ilang::InstrLvlAbsPtr m2, nlohmann::json &rel_map);
void AddDepState(nlohmann::json& dep_map, ilang::InstrLvlAbsPtr& top);
void AddInitState(nlohmann::json& init_map, ilang::InstrLvlAbsPtr& top);
void DepStateTrigDest(ilang::ExprPtr& dep_state, ilang::InstrLvlAbsPtr& m_dest);
void AddInstr(ilang::InstrLvlAbsPtr& top);
