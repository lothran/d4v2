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
#include <src/solvers/ActivityManager.hpp>
#include <src/specs/cnf/SpecManagerCnf.hpp>

#include "../ScoringMethod.hpp"

namespace d4 {
//Weightless VSADS scoring implementation

class ScoringMethodVsads4 : public ScoringMethod {
private:
  SpecManagerCnf &om;
  ActivityManager &activity;

public:
  ScoringMethodVsads4(SpecManagerCnf &o, ActivityManager &a);
  double computeScore(Var v);
  Var selectVariable(std::vector<Var> &vars,
                     std::function<bool(Var)> can_select) final;
  virtual void decay();

};
} // namespace d4
