#include "helper.h"
#include <queue>

using namespace ilang;
/*
CustExprSet compute_top_input(IlaMap &ila_map, nlohmann::json &comp_map)
{
    auto i_o_map = comp_map["i-o map"].get<std::vector<nlohmann::json>>();
    CustExprSet merged_inputs;
    CustExprSet total_inputs;
    for (auto &m : ila_map)
    {
        for (int i = 0; i < m.second->input_num(); i++)
        {
            total_inputs.insert(m.second->input(i));
        }
    }
    for (auto &it : i_o_map)
    {
        auto m1_string = it["models"]["m1"];
        auto m2_string = it["models"]["m2"];
        auto m1 = ila_map[m1_string];
        auto m2 = ila_map[m2_string];
        auto interface_map = it["interfaces"];
        for (auto itf_it = interface_map.begin(); itf_it != interface_map.end(); itf_it++)
        {
            merge_state_input(m1, itf_it.key(), m2, itf_it.value().get<std::string>());
            // TODO We don't have a clean way now but need to remove the inputs from child-ILA
            merged_inputs.insert(m2->input(itf_it.value().get<std::string>()));
        }
    }
    std::cout << "merged_inputs" << std::endl;
    for (auto &temp : merged_inputs)
    {
        std::cout << temp << " ;" << std::endl;
    }
    std::cout << "total_inputs" << std::endl;
    for (auto &temp : total_inputs)
        std::cout << temp << " ;" << std::endl;

    CustExprSet res;
    std::set_difference(total_inputs.begin(), total_inputs.end(), merged_inputs.begin(), merged_inputs.end(), std::inserter(res, res.end()));
    return res;
}

void merge_state_input(InstrLvlAbsPtr m1, std::string s_name, InstrLvlAbsPtr m2, std::string i_name)
{
    // TODO check s_name is in m1 and i_name is in m2
    auto m1_s = m1->state(s_name);
    auto m2_i = m2->input(i_name);
    auto DfsSwitch = [&m1_s, &m2_i](const InstrLvlAbsPtr &m) { switch_expr_in_ila(m, m1_s, m2_i); };
    m2->DepthFirstVisit(DfsSwitch);
}

void switch_expr_in_ila(InstrLvlAbsPtr m, ExprPtr new_e, ExprPtr old_e)
{
    for (int i = 0; i < m->instr_num(); i++)
    {
        auto instr = m->instr(i);
        auto DfsSwitch = [&new_e, &old_e](const ExprPtr &e) { switch_expr(e, new_e, old_e); };
        auto decode_expr = instr->decode();
        decode_expr->DepthFirstVisit(DfsSwitch);
        auto updated_states = instr->updated_states();
        for (auto &updated_state : updated_states)
        {
            auto update_expr = instr->update(updated_state);
            update_expr->DepthFirstVisit(DfsSwitch);
        }
    }
}

void switch_expr(ExprPtr e, ExprPtr new_e, ExprPtr old_e)
{
    for (size_t i = 0; i < e->arg_num(); i++)
    {
        auto arg_1 = e->arg(i);
        if (arg_1 == old_e)
        {
            e->replace_arg(i, new_e);
        }
    }
}

RefPtr RefineHL(const InstrLvlAbsPtr hl_ila, const std::string &instr_name)
{
    auto ref = RefinementMap::New();
    auto instr = hl_ila->instr(instr_name);
    ref->set_tgt(hl_ila);
    ref->set_appl(instr->decode());
    ref->set_flush(asthub::Eq(hl_ila->input("oc8051_ROM_rdata_0"), asthub::BvConst(0, 8)));

    ref->set_cmpl(asthub::Eq(hl_ila->input("oc8051_ROM_rdata_0"), asthub::BvConst(0, 8)));
    ref->set_step_orig(0);
    ref->set_step_appl(0);
    return ref;
}

ExprPtr iter_ila_hier_decode_and_valid(InstrLvlAbsPtr top) {
    std::queue<InstrLvlAbsPtr> m_vec;
    auto cond = asthub::BoolConst(true);
    m_vec.push(top);
    while (m_vec.size() != 0) {
        auto front = m_vec.front();
        m_vec.pop();
        for (size_t i = 0; i < front->child_num(); i++) {
            auto child = front->child(i);
            for (size_t j = 0; j < child->instr_num(); j++) {
                auto instr = child->instr(j);
                // if (instr->name().str() != "I.0")
                    cond = asthub::And(cond, asthub::Not(asthub::And(instr->decode(), child->valid())));
            }
            m_vec.push(child);
        } 
    }
    return cond;
}

RefPtr RefineComp(const InstrLvlAbsPtr comp_ila, const std::string &instr_name)
{
    auto ref = RefinementMap::New();
    auto instr = comp_ila->child("oc8051")->instr(instr_name);
    ref->set_tgt(comp_ila);
    ref->set_appl(instr->decode());
    ref->set_flush(asthub::Eq(comp_ila->input("oc8051_ROM_rdata_0"), asthub::BvConst(0, 8)));

    // auto cmpl = asthub::Eq(comp_ila->input("oc8051_ROM_rdata_0"), asthub::BvConst(0, 8));
    auto cmpl = asthub::BoolConst(true);
    cmpl = asthub::And(cmpl, iter_ila_hier_decode_and_valid(comp_ila));

    ref->set_cmpl(cmpl);
    ref->set_step_orig(2);
    ref->set_step_appl(4);
    return ref;
}

RelPtr GetRelation(const InstrLvlAbsPtr m1, const InstrLvlAbsPtr m2, nlohmann::json &rel_map)
{
    auto rel = RelationMap::New();
    for (auto rel_it = rel_map.begin(); rel_it != rel_map.end(); rel_it++)
    {
        try
        {
            auto var1 = m1->state(rel_it.key());
            auto var2 = m2->state(rel_it.value().get<std::string>());
            rel->add(asthub::Eq(var1, var2));
        }
        catch (...)
        {
            std::cout << "Relation map variables not found in models." << std::endl;
        }
    }
    return rel;
}

void DepStateTrigDest(ExprPtr& dep_state, InstrLvlAbsPtr& m_dest) {
  if (m_dest->valid()) {
      auto valid = asthub::And(m_dest->valid(), dep_state);
      m_dest->ForceSetValid(valid);
  } else
      m_dest->SetValid(dep_state);
  for (auto i = 0; i < m_dest->instr_num(); i++) {
    auto instr = m_dest->instr(i);
    instr->set_update(dep_state, asthub::BoolConst(false));
    auto decode = instr->decode();
  }    
}

void AddDepState(nlohmann::json& dep_map, InstrLvlAbsPtr& top) {
  auto src_name = dep_map["models"]["src"].get<std::string>();
  auto dest_name = dep_map["models"]["dest"].get<std::string>();
  auto m_src = top->child(src_name);
  auto m_dest = top->child(dest_name);
  
  auto dest_flag = top->NewBoolState(dest_name + "_flag");

  DepStateTrigDest(dest_flag, m_dest);
  
  auto src_instrs = dep_map["instructions"].get<std::vector<nlohmann::json>>();
  for (auto& src_instr_name : src_instrs) {
    auto src_instr = m_src->instr(src_instr_name.get<std::string>());
    src_instr->set_update(dest_flag, asthub::BoolConst(true));
  }
}

void AddInitState(nlohmann::json& init_map, InstrLvlAbsPtr& top) {
  auto init_name = init_map["model"].get<std::string>();
  auto instrs = init_map["instructions"].get<std::vector<nlohmann::json>>();
  auto init_flag = top->NewBoolState("init_flag");
  for (auto& instr_name : instrs) {
      auto instr = top->instr(instr_name.get<std::string>());
      instr->set_update(init_flag, asthub::BoolConst(true));
  }
  auto child = top->child(init_name);
  child->ForceSetValid(init_flag);
  for (auto i = 0; i < child->instr_num(); i++) {
      auto instr = child->instr(i);
      instr->set_update(init_flag, asthub::BoolConst(false));
  }
}
*/

void AddInstr(InstrLvlAbsPtr& top) {
    for (int i = 0; i < 255; i++) {
        auto instr = top->NewInstr("i." + std::to_string(i));
        auto s = top->input("oc8051_ROM_rdata_0");
        instr->set_decode(asthub::Eq(s, asthub::BvConst(i, 8)));
    }
}
