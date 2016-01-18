# mortgage_calculator.rb

require 'yaml'
MESSAGES = YAML.load_file('mortgage_calculator.yml')

def prompt(message)
  puts "=> #{message}"
end

def valid_integer?(input)
  input.to_i.to_s == input && input.to_i > 0
end

def valid_float?(input)
  valid_integer?(input) || (input.to_f.to_s == input && input.to_f > 0)
end

def get_number_input(message, type)
  prompt(message)
  loop do
    input = gets.chomp
    if type == :integer && valid_integer?(input)
      return input
    elsif type == :float && valid_float?(input)
      return input
    end
    prompt(MESSAGES['invalid_input'])
  end
end

def calculate_again?
  prompt(MESSAGES['calculate_again'])
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

def calculate_monthly_payment
  loan_amount     = get_number_input(MESSAGES['loan_amount'], :integer).to_f
  annual_rate     = get_number_input(MESSAGES['annual_rate'], :float).to_f
  duration_years  = get_number_input(MESSAGES['loan_duration'], :integer).to_f
  duration_months = duration_years * 12
  monthly_rate    = annual_rate.to_f / 100 / 12

  # P = L[c(1 + c)n]/[(1 + c)n - 1]
  # L = Loan amount; n = number of months; c = monthly interest rate
  loan_amount * (monthly_rate * (1 + monthly_rate)** duration_months) /
                ((1 + monthly_rate)** duration_months - 1)
end

loop do

  monthly_payment = calculate_monthly_payment
  puts "Your monthly payment is #{format('%02.2f', monthly_payment)}"
  break unless calculate_again?

end
