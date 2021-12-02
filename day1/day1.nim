import sequtils
import strutils

let depths = readFile("day1/data").splitLines.filterIt(it.len > 0).map(parseInt)

var count = 0
for i in 1 .. len(depths) - 1:
  if depths[i - 1] < depths[i]:
    count += 1
echo "Part 1: ", count

count = 0
var previousWindowSum = foldl(depths[0 .. 2], a + b)
for i in 3 .. len(depths) - 1:
  let currentWindowSum = foldl(depths[i-2 .. i], a + b)
  if previousWindowSum < currentWindowSum:
    count += 1
  previousWindowSum = currentWindowSum
echo "Part 2: ", count
