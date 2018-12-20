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
# Function definitions

def part_one(input)
  line = input[0]
  sum = 0

  line.each_char do |c|
    if c == '('
      sum += 1
    elsif c == ')'
      sum -= 1
    end
  end

  puts sum
end

def part_two(input)
  line = input[0]
  floor = 0
  pos = 0

  line.each_char do |c|
    if c == '('
      floor += 1
    elsif c == ')'
      floor -= 1
    end
    pos += 1
    break if floor == -1
  end

  puts pos
end

input_file = File.readlines('day-1-input.txt').map(&:chomp)

part_one(input_file) # 280
part_two(input_file) # 1797
