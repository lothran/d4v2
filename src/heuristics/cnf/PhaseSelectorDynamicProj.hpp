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
#include <ostream>

#include "PartitioningHeuristicStaticSingle.hpp"
#include "PhaseSelectorManager.hpp"

namespace d4 {
class PhaseSelectorDynamicProj : public PhaseSelectorManager {
private:
  double m_limitRatio;

public:
  PhaseSelectorDynamicProj(PartitioningHeuristicStaticSingle *staticPartitioner,
                           double limitRatio, std::ostream &out);

  bool isStillOk(std::vector<Var> &component);
};
} // namespace d4
