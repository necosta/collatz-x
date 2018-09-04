require "option_parser"
require "../collatz"
require "../main"

enum Option
  RunOnce         # 0
  RunUpwards      # 1
  RunLoopAnalysis # 2
end

option = Option::RunOnce
value = 100

OptionParser.parse! do |parser|
  parser.banner = "Usage:"
  parser.on("-o option", "--option option", "Select a running option") { |opt| option = Option.parse(opt) }
  parser.on("-v value", "--value value", "Set a starting value") { |v| value = v.to_i }
  parser.on("-h", "--help", "Show this help") { puts parser }
  parser.invalid_option do |flag|
    STDERR.puts "ERROR: #{flag} is not a valid option"
    STDERR.puts parser
    exit(1)
  end
end

case option
when Option::RunOnce
  puts "Running Collatz for value #{value}"
  sysout = Collatz.runWithPrint(value.to_u64)
  sysout.each do |o|
    puts o
  end
when Option::RunUpwards
  puts "Running Collatz starting at value #{value}"
  while true
    puts "Value: #{value}"
    sysout = Collatz.runWithPrint(value.to_u64)
    sysout.each do |o|
      puts o
    end
    value = value + 18
  end
when Option::RunLoopAnalysis
  cycles = value
  # ToDo: Soft-code permutations value
  permutations = 1
  puts "Running loop analysis for #{cycles} cycle(s) and #{permutations} permutation(s)"
  Math.runAnalysis(cycles, permutations).each do |i|
    puts i
  end
end
