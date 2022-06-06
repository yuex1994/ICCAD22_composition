#include "datapath.h"

ExprRef resolve_addr(ExprRef& addr, ExprRef& bit_addr) {
  auto ret = Ite(bit_addr, Ite(Extract(addr, 7, 7) == BvConst(1, 1), Concat(Concat(BvConst(1, 1), Extract(addr, 6, 3)), BvConst(0, 3)), Concat(BvConst(0b0010, 4), Extract(addr, 6, 3))), addr);  
  return ret;
}

ExprRef get_bit(ExprRef& byte, ExprRef& addr) {
  auto ret = Ite(addr == 1, Extract(byte, 1, 1), Extract(byte, 0, 0));
  for (int i = 2; i < 8; i++)
    ret = Ite(addr == i, Extract(byte, i, i), ret);
  return ret;
}
