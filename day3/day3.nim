import math
from sequtils import filterIt
from strutils import parseInt, splitLines
from sugar import collect

let
  lines = readFile("day3/data").splitLines.filterIt(it.len > 0)
  bitsPerLine = len(lines[0])

var bits = collect(newSeq):
  for i in 0 .. bitsPerLine - 1: (0, 0)
for line in lines:
  for idx, bit in line:
    case bit:
      of '0': bits[idx][0] += 1
      of '1': bits[idx][1] += 1
      else: discard
var gammaRateSeq, epsilonRateSeq: seq[int]
for bitTuple in bits:
  if bitTuple[0] > bitTuple[1]:
    gammaRateSeq.add(0)
    epsilonRateSeq.add(1)
  else:
    gammaRateSeq.add(1)
    epsilonRateSeq.add(0)
var gammaRate, epsilonRate, count = 0
for i in countdown(len(gammaRateSeq) - 1, 0):
  gammaRate += gammaRateSeq[i] * (2 ^ count)
  epsilonRate += epsilonRateSeq[i] * (2 ^ count)
  count += 1
echo "Part 1: ", gammaRate * epsilonRate
