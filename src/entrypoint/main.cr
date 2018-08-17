require "../main"

maxCycles = 2
maxPermutations = 1
(1..maxPermutations).each do |p|
  Math.run(maxCycles, p)
end
