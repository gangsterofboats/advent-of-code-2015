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
  reg = Regexp.union [*?a..?z].each_cons(3).map(&:join)
  input.succ! until input[reg] && input !~ /[iol]/ && input.scan(/(.)\1/).length >= 2
  puts input
end

def part_two(ipt)
  r = Regexp.union [*?a..?z].each_cons(3).map(&:join)
  ipt.succ! until ipt[r] && ipt !~ /[iol]/ && ipt.scan(/(.)\1/).length > 1
  puts ipt
end

input_str_p1 = 'vzbxkghb'
input_str_p2 = 'vzbxxyzz'

part_one(input_str_p1) # vzbxxyzz
part_two(input_str_p2) # vzcaabcc
