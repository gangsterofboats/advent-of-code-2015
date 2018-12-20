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
require 'digest'

# Function definitions

def part_one(input)
  i = 0

  loop do
    full_string = input + i.to_s
    hash_string = Digest::MD5.hexdigest full_string
    i += 1
    break if hash_string[0..4] == '00000'
  end
  puts i - 1
end

def part_two(input)
  i = 0

  loop do
    full_string = input + i.to_s
    hash_string = Digest::MD5.hexdigest full_string
    i += 1
    break if hash_string[0..5] == '000000'
  end
  puts i - 1
end

input_s = 'yzbqklnj'

# part_one(input_s) # 282749
part_two(input_s) # 9962624
