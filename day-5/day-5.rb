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
  letters = ('a'..'z').to_a
  letter_pairs = []
  bad_pairs = ['ab', 'cd', 'pq', 'xy']
  letters.each do |l|
    letter_pairs.push(l * 2)
  end
  nice_strs = 0
  input.each do |s|
    nice_props = 0
    nice_props += 1 if s.count('aeiou') >= 3
    nice_props += 1 if letter_pairs.any? {|pr| s.include? pr}
    nice_props += 1 if not bad_pairs.any? {|p| s.include? p}
    nice_strs += 1 if nice_props == 3
  end
  puts nice_strs
end

def part_two(input)
  nice_strs = 0
  input.each do |s|
    nice_props = 0
    nice_props += 1 if s.scan(/(..).*\1/).count == 1
    nice_props += 1 if s.scan(/(.).\1/).count >= 1
    nice_strs += 1 if nice_props == 2
  end
  puts nice_strs
end

input_file = File.readlines('day-5-input.txt').map(&:chomp)

part_one(input_file) # 236
part_two(input_file) # 51
