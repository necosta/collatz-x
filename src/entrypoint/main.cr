require "../main"

# Math.runWithValues

maxCycles = 4
maxPermutations = 4
(0..maxCycles).each do |c|
  (0..maxPermutations).each do |p|
    Math.run(c, p)
  end
end
