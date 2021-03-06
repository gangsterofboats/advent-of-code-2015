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
  actual_length = 0
  proc_length = 0
  input.each do |line|
    actual_length += line.length
    proc_length += eval(line).length
  end
  puts actual_length - proc_length
end

def part_two(input)
  actual_length = 0
  proc_length = 0
  input.each do |line|
    actual_length += line.length
    proc_length += line.inspect.length
  end
  puts proc_length - actual_length
end

input_file = File.readlines('day-8-input.txt').map(&:chomp)

# part_one(input_file) # 1371
part_two(input_file) #
