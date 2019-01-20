require_relative "../data_structures/data_structures.rb"

# SESSION
# 1

# PROMPT
=begin
Validate if a given string can be interpreted as a decimal number.

Some examples:
"0" => true
" 0.1 " => true
"abc" => false
"1 a" => false
"2e10" => true
" -90e3   " => true
" 1e" => false
"e3" => false
" 6e-1" => true
" 99e2.5 " => false
"53.5e93" => true
" --6 " => false
"-+3" => false
"95a54e53" => false

Note: It is intended for the problem statement to be ambiguous. You should gather all requirements up front before implementing one. However, here is a list of characters that can be in a valid decimal number:

Numbers 0-9
Exponent - "e"
Positive/negative sign - "+"/"-"
Decimal point - "."
Of course, the context of these characters also matters in the input.
=end

DIGITS = [*0..9].map(&:to_s).to_set.freeze

DFA = begin
  graph = Graph.new

  # Declare base lambdas
  space = ->(char) { char == " " }
  sign  = ->(char) { char == "+" || char == "-" }
  digit = ->(char) { DIGITS.include?(char) }
  dot   = ->(char) { char == "." }
  exp   = ->(char) { char == "e" }

  # Create nodes
  graph[0] = space # leading whitespace
  graph[1] = sign  # main number's sign
  graph[2] = digit # main number's digits
  graph[3] = dot   # decimal point that CANNOT be ended on
  graph[4] = dot   # decimal point that CAN be ended on
  graph[5] = digit # desicand's digits
  graph[6] = exp   # exponent
  graph[7] = sign  # exponent's sign
  graph[8] = digit # exponent's digits
  graph[9] = space # trailing whitespace

  # node keys => children key array 
  connections = {
    0 => [0, 1, 2, 3],
    1 => [2, 3],
    2 => [2, 4, 6, 9],
    3 => [5],
    4 => [5, 6, 9],
    5 => [5, 6, 9],
    6 => [7, 8],
    7 => [8],
    8 => [8, 9],
    9 => [9]
  }

  # Create connections
  connections.each do |self_key, child_keys|
    child_keys.each do |child_key|
      graph[self_key].children << graph[child_key]
    end
  end

  graph
end.freeze

def is_number(str)
  valid_end_node?(end_node(str))
end

def end_node(str)
  node = DFA[0]

  return nil unless str.each_char.all? do |char|
    node.children.any? do |child|
      handled = child.value.call(char)
      node = child if handled
      handled
    end
  end

  node
end

def valid_end_node?(node)
  [2, 4, 5, 8, 9].include?(node&.key)
end
