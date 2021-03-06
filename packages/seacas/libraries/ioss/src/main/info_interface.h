/*
 * Copyright(C) 2012 Sandia Corporation.  Under the terms of Contract
 * DE-AC04-94AL85000 with Sandia Corporation, the U.S. Government retains
 * certain rights in this software
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are
 * met:
 *
 *     * Redistributions of source code must retain the above copyright
 *       notice, this list of conditions and the following disclaimer.
 *
 *     * Redistributions in binary form must reproduce the above
 *       copyright notice, this list of conditions and the following
 *       disclaimer in the documentation and/or other materials provided
 *       with the distribution.
 *
 *     * Neither the name of Sandia Corporation nor the names of its
 *       contributors may be used to endorse or promote products derived
 *       from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 */
#ifndef info_SystemInterface_h
#define info_SystemInterface_h

#include "Ioss_GetLongOpt.h" // for GetLongOption
#include <iosfwd>            // for ostream
#include <string>            // for string

/** \brief A special namespace for the io_info demonstration program interface.
 */
namespace Info {
  class Interface
  {
  public:
    Interface();
    ~Interface();

    bool parse_options(int argc, char **argv);

    int  summary() const { return summary_; }
    bool check_node_status() const { return checkNodeStatus_; }
    bool compute_volume() const { return computeVolume_; }
    bool compute_bbox() const { return computeBBox_; }
    bool adjacencies() const { return adjacencies_; }
    bool ints_64_bit() const { return ints64Bit_; }
    bool list_groups() const { return listGroups_; }

    int  surface_split_scheme() const { return surfaceSplitScheme_; }
    char field_suffix_separator() const { return fieldSuffixSeparator_; }
    bool use_generic_names() const { return useGenericNames_; }

    std::string filename() const { return filename_; }
    std::string type() const { return filetype_; }
    std::string groupname() const { return groupname_; }

    //! Dumps representation of data in this class to cerr

  private:
    void enroll_options();

    Ioss::GetLongOption options_;

    bool checkNodeStatus_;
    bool computeVolume_;
    bool adjacencies_;
    bool ints64Bit_;
    bool computeBBox_;
    bool listGroups_;
    bool useGenericNames_;
    char fieldSuffixSeparator_;

    int summary_;
    int surfaceSplitScheme_;

    std::string filetype_;
    std::string filename_;
    std::string groupname_;
  };
}
#endif
