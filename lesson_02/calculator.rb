# command line calculator

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(input)
  input.to_i.to_s == input || input.to_f.to_s == input
end

def convert_to_number(input)
  if input.to_i.to_s == input
    input.to_i
  else
    input.to_f
  end
end

def valid_operator?(input)
  %w(+ - * /).include?(input) && input.length == 1
end

def get_input(message, type)
  prompt(message)
  loop do
    input = gets.chomp
    if type == :number && valid_number?(input)
      return input
    elsif type == :operator && valid_operator?(input)
      return input
    else
      prompt(MESSAGES['invalid_input'])
    end
  end
end

def calculate_result(first_number, second_number, operator)
  first  = convert_to_number(first_number)
  second = convert_to_number(second_number)
  if %w(+ - *).include?(operator)
    first.send(operator, second)
  else
    second == 0.0 ? 'Divide by zero error' : first.to_f / second.to_f
  end
end

loop do
  first_number  = get_input(MESSAGES['input_first_number'], :number)
  second_number = get_input(MESSAGES['input_second_number'], :number)
  operator      = get_input(MESSAGES['input_operator'], :operator)
  result        = calculate_result(first_number, second_number, operator)

  if result != 'Divide by zero error'
    prompt("#{first_number}#{operator}#{second_number} = #{result}")
  else
    prompt(result)
  end

  prompt(MESSAGES['calculate_again'])
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
