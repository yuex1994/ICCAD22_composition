#ifndef DATAPATH_H__
#define DATAPATH_H__

#include <ilang/ilang++.h>
#include <vector>

using namespace ilang;

class DATAPATH {
public:
  DATAPATH();
  Ila model;

  const int kRAM_MAX = 255;
  const int kIRAM_ADDR_SIZE = 8;

};

ExprRef resolve_addr(ExprRef& addr, ExprRef& bit_addr);
ExprRef get_bit(ExprRef& byte, ExprRef& addr);
#endif
