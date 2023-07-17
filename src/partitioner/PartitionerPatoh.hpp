/*
 * d4
 * Copyright (C) 2020  Univ. Artois & CNRS
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
#pragma once

#include <boost/program_options.hpp>
#include <functional>
#include <vector>

#include "PartitionerManager.hpp"

namespace d4 {
class PartitionerPatoh : public PartitionerManager {
protected:
  std::vector<bool> m_markedNodes;
  std::vector<int> m_mapNodes;

  int *m_xpins;
  int *m_pins;
  int *m_cwghts;
  int *m_partvec;
  int *m_partweights;

public:
  PartitionerPatoh(unsigned maxNodes, unsigned maxEdges,
                   unsigned maxSumEdgeSize, std::ostream &out);

  virtual ~PartitionerPatoh();
  void computePartition(HyperGraph &hypergraph, Level level,
                        std::vector<int> &partition);
};
} // namespace d4
