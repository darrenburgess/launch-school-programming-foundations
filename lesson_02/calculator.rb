# command line calculator

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  puts "=> #{message}"
end

def valid_input?(input, type)
  if type == :num
    # small issue input = '1asdf' will validate as '1asdf'.to_i = 1
    input == '0' || input == '0.0' || input.to_i != 0
  else
    input =~ /^[-+*\/]$/ # one character in the accepted operators
  end
end

def get_input(message, type)
  prompt(message)
  loop do
    input = gets.chomp
    if valid_input?(input, type)
      return type == :num ? input.to_f : input
    else
      prompt(MESSAGES['invalid_input'])
    end
  end
end

def get_result(a, b, op)
  if op == '+' || op == '-' || op == '*'
    eval("#{a} #{op} #{b}") # yes, eval is evil
  else
    b == 0.0 ? 'Divide by zero error' : a.to_f / b.to_f
  end
end

loop do
  a      = get_input(MESSAGES['input_first_number'], :num)
  b      = get_input(MESSAGES['input_second_number'], :num)
  op     = get_input(MESSAGES['input_operator'], :op)
  result = get_result(a, b, op)

  if result != 'Divide by zero error'
    prompt("#{a.to_s + op + b.to_s} = #{result}")
  else
    prompt(result)
  end

  prompt(MESSAGES['calculate_again'])
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
