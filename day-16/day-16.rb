#!/usr/bin/env ruby
################################################################################
# Copyright (C) 2018 Michael Wiseman                                           #
#                                                                              #
# This program is free software: you can redistribute it and/or modify it      #
# under the terms of the GNU Affero General Public License as published by the #
# Free Software Foundation, either version 3 of the License, or (at your       #
# option) any later version.                                                   #
#                                                                              #
# This program is distributed in the hope that it will be useful, but WITHOUT  #
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or        #
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Affero General Public License #
# for more details.                                                            #
#                                                                              #
# You should have received a copy of the GNU Affero General Public License     #
# along with this program.  If not, see <https://www.gnu.org/licenses/>.       #
################################################################################
require 'json'

# Function definitions

def part_one(input)
  ticker_tape_scan = {:children => 3, :cats => 7, :samoyeds => 2, :pomeranians => 3, :akitas => 0, :vizslas => 0, :goldfish => 5, :trees => 3, :cars => 2, :perfumes => 1}

  input.each do |line|
    curr_s, s_ps = line.split(': ', 2)
    props = eval "{#{s_ps}}"
    match = 0
    props.each do |k,v|
      if v == ticker_tape_scan[k]
        match += 1
      end
    end
    if match == 3
      puts curr_s
    end
  end
end

def part_two(input)
  ticker_tape_scan = {:children => 3, :cats => 7, :samoyeds => 2, :pomeranians => 3, :akitas => 0, :vizslas => 0, :goldfish => 5, :trees => 3, :cars => 2, :perfumes => 1}

  input.each do |line|
    curr_s, s_ps = line.split(': ', 2)
    props = eval "{#{s_ps}}"
    match = 0
    props.each do |k,v|
      if k == :cats and v > 7
        match += 1
      elsif k == :trees and v > 3
        match += 1
      elsif k == :pomeranians and v < 3
        match += 1
      elsif k == :goldfish and v < 5
        match += 1
      else
        match += 1 if v == ticker_tape_scan[k]
      end
    end
    if match == 3
      puts curr_s
    end
  end
end

input_file = File.readlines('day-16-input.txt').map(&:chomp)

# part_one(input_file) # 213
part_two(input_file) #
