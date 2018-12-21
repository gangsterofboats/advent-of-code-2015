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
  dirs_to = {}
  dirs_from = {}
  input.each do |line|
    line.gsub!(/ =.*$/, '')
    f, t = line.split(' to ')
    if not dirs_to.key? f
      dirs_to[f] = [t]
    else
      dirs_to[f].push(t)
    end
    if not dirs_from.key? t
      dirs_from[t] = [f]
    else
      dirs_from[t].push(f)
    end
  end
  p dirs_from.sort.to_h
  p dirs_to.sort.to_h
end

# def part_two(input)
# end

input_file = File.readlines('day-9-input.txt').map(&:chomp)

# Did this by hand
part_one(input_file) # 141
# part_two(input_file) # 736
