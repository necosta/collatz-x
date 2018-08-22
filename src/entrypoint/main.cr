require "option_parser"
require "../collatz"
require "../main"

enum Option
  Collatz  # 0
  Analysis # 1
end

out = Option::Collatz
value = 1

OptionParser.parse! do |parser|
  parser.banner = "Usage:"
  parser.on("-o option", "--option option", "Selects a run option") { |option| out = Option.parse(option) }
  parser.on("-v value", "--value value", "Sets a starting value") { |v| value = v.to_i }
  parser.on("-h", "--help", "Shows this help") { puts parser }
  parser.invalid_option do |flag|
    STDERR.puts "ERROR: #{flag} is not a valid option."
    STDERR.puts parser
    exit(1)
  end
end

if (out == Option::Collatz)
  puts "Running collatz for value #{value}"
  sysout = Collatz.runWithPrint(value)
  sysout.each do |o|
    puts o
  end
else
  puts "Running analysis"
  cycles = 1
  permutations = 2
  Math.runAnalysis(cycles, permutations).each do |i|
    puts i
  end
end
