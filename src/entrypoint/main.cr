require "../main"

maxCycles = 1
maxPermutations = 2
(1..maxPermutations).each do |p|
  Math.run(maxCycles, p)
end
