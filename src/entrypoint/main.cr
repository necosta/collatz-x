require "../main"

maxCycles = 1
maxPermutations = 2
(0..maxCycles).each do |c|
  (0..maxPermutations).each do |p|
    Math.run(c, p)
  end
end
