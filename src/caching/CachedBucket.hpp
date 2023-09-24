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
#include <sys/types.h>

#include <bitset>

#include "DataInfo.hpp"

namespace d4 {
template <class T> class CachedBucket {
public:
  char *data;
  T fc;

  CachedBucket() { data = NULL; }

  inline void set(char *d, DataInfo dnew) {
    data = d-sizeof(DataInfo);
    *(DataInfo *)data = dnew;
  } // set

  inline void lockedBucket(T v) { fc = v; }
  inline const DataInfo &header() const { return *(DataInfo *)data; }
  inline DataInfo &header() { return *(DataInfo *)data; }
  inline uint64_t getInfo() { return data? header().info1:0; }
  inline void szData(int s){  data? header().szData(s):void(); }
  inline unsigned szData() const { return data?header().szData():0; }
  inline unsigned nbVar() const { return data? header().nbVar():0; }
  inline void reset() { header().reset(); }

  inline void display() {
    std::cout << std::bitset<64>(header().info1) << " <<<<<<\n";
    for (unsigned i = 0; i < header().szData(); i++)
      std::cout << std::bitset<8>(data[i]) << " ";
    std::cout << "\n";
  }

  inline DataInfo &getDataInfo() { return header(); }
  inline bool sameHeader(CachedBucket<T> &b) { return header() == b.header(); }
};
} // namespace d4
