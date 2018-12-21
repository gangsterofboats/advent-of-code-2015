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
  lights_map = Array.new(1000) {Array.new(1000, 0)}
  input.each do |ln|
    if ln.include? 'on'
      action = 'turn on'
    elsif ln.include? 'off'
      action = 'turn off'
    else
      action = 'toggle'
    end
    ranges = ln.scan(/\d+\,\d+/)
    starx, stary = ranges[0].split(',').map(&:to_i)
    enx, eny = ranges[1].split(',').map(&:to_i)
    (stary..eny).each do |y|
      (starx..enx).each do |x|
        if action == 'turn on'
          lights_map[y][x] = 1
        elsif action == 'turn off'
          lights_map[y][x] = 0
        else
          if lights_map[y][x] == 0
            lights_map[y][x] = 1
          else
            lights_map[y][x] = 0
          end
        end
      end
    end
  end
  lights_on = 0
  (0..999).each do |y_axis|
    (0..999).each do |x_axis|
      lights_on += 1 if lights_map[y_axis][x_axis] == 1
    end
  end
  puts lights_on
end

def part_two(input)
  lights_map = Array.new(1000) {Array.new(1000, 0)}
  input.each do |ln|
    if ln.include? 'on'
      action = 'turn on'
    elsif ln.include? 'off'
      action = 'turn off'
    else
      action = 'toggle'
    end
    ranges = ln.scan(/\d+\,\d+/)
    starx, stary = ranges[0].split(',').map(&:to_i)
    enx, eny = ranges[1].split(',').map(&:to_i)
    (stary..eny).each do |y|
      (starx..enx).each do |x|
        if action == 'turn on'
          lights_map[y][x] += 1
        elsif action == 'turn off'
          lights_map[y][x] -= 1 unless lights_map[y][x] == 0
        else
          lights_map[y][x] += 2
        end
      end
    end
  end
  brightness = 0
  (0..999).each do |y_axis|
    (0..999).each do |x_axis|
      brightness += lights_map[y_axis][x_axis]
    end
  end
  puts brightness
end

input_file = File.readlines('day-6-input.txt').map(&:chomp)

part_one(input_file) # 377891
part_two(input_file) # 14110788
