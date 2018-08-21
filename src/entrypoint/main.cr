require "option_parser"
require "../main"

enum Option
  Collatz  # 0
  Analysis # 1
end

out = Option::Collatz

OptionParser.parse! do |parser|
  parser.banner = "Usage:"
  parser.on("-o option", "--option option", "Selects a run option") { |option| out = Option.parse(option) }
  parser.on("-h", "--help", "Shows this help") { puts parser }
  parser.invalid_option do |flag|
    STDERR.puts "ERROR: #{flag} is not a valid option."
    STDERR.puts parser
    exit(1)
  end
end

if (out == Option::Collatz)
  puts "Running collatz function"
  # ToDo...
else
  puts "Running analysis"
  maxCycles = 1
  maxPermutations = 2
  (1..maxPermutations).each do |p|
    Math.run(maxCycles, p)
  end
end
