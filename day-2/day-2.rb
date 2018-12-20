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
  total_area = 0

  input.each do |line|
    l, w, h = line.split('x').map(&:to_i)
    smlst_area = [l*w, w*h, l*h].min
    total_area += 2*(l*w + w*h + l*h) + smlst_area
  end

  puts total_area
end

def part_two(input)
  total_ribbon = 0

  input.each do |line|
    l, w, h = line.split('x').map(&:to_i)
    dims = [l, w, h].sort
    min_x = dims[0]
    min_y = dims[1]
    total_ribbon += (l*w*h) + 2 * (min_x + min_y)
  end

  puts total_ribbon
end

input_file = File.readlines('day-2-input.txt').map(&:chomp)

# part_one(input_file) # 1606483
part_two(input_file) # 3842356
