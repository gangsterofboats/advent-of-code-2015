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
  registers = {"a" => 0, "b" => 0}
  act_point = 0

  while act_point < input.size
    f,s = input[act_point].split(' ', 2)

    case f
    when 'hlf'
      registers[s] = registers[s] / 2
      act_point += 1
    when 'tpl'
      registers[s] = registers[s] * 3
      act_point += 1
    when 'inc'
      registers[s] += 1
      act_point += 1
    when 'jmp'
      offset = s.to_i
      act_point += offset
    when 'jie'
      reg, offset = s.split(', ')
      offset = offset.to_i
      if registers[reg].even?
        act_point += offset
      end
    when 'jio'
      reg, offset = s.split(', ')
      offset = offset.to_i
      if registers[reg] == 1
        act_point += offset
      end
    end
  end
  puts registers['b']
end

def part_two(input)
  registers = {"a" => 1, "b" => 0}
  act_point = 0

  while act_point < input.size
    f,s = input[act_point].split(' ', 2)

    case f
    when 'hlf'
      registers[s] = registers[s] / 2
      act_point += 1
    when 'tpl'
      registers[s] = registers[s] * 3
      act_point += 1
    when 'inc'
      registers[s] += 1
      act_point += 1
    when 'jmp'
      offset = s.to_i
      act_point += offset
    when 'jie'
      reg, offset = s.split(', ')
      offset = offset.to_i
      if registers[reg].even?
        act_point += offset
      end
    when 'jio'
      reg, offset = s.split(', ')
      offset = offset.to_i
      if registers[reg] == 1
        act_point += offset
      end
    end
  end
  puts registers['b']
end

input_file = File.readlines('day-23-input.txt').map(&:chomp)

part_one(input_file) # 307
part_two(input_file) # 160
