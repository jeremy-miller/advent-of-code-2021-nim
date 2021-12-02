import sequtils
import strutils
import std/strscans

let commands = readFile("day2/data").splitLines.filterIt(it.len > 0)
const pattern = "$w$s$i"

var position, depth = 0
var
  direction: string
  value: int
for command in commands:
  if scanf(command, pattern, direction, value):
    case direction:
      of "forward":
        position += value
      of "up":
        depth -= value
      of "down":
        depth += value
echo "Part 1: ", position * depth

var aim = 0
position = 0
depth = 0
for command in commands:
  if scanf(command, pattern, direction, value):
    case direction:
      of "forward":
        position += value
        depth += aim * value
      of "up":
        aim -= value
      of "down":
        aim += value
echo "Part 2: ", position * depth
