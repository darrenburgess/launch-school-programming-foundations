require 'mechanize'
require 'pry'

mechanize = Mechanize.new
page = mechanize.get('http://umop.com/rps101/alloutcomes.htm')
items = page.search('font').text.inspect.split("\\n")
gestures = []
items.each do |item|
  if (1..101).include?(item.gsub(/\D/, '').to_i)
    if item =~ /-/
      gestures << item.partition("- ")[2].downcase.strip
    end
  end
end

outcomes = page.search('table').text.inspect.split("\\n")

outcomes.delete_if { |outcome| ["\"", ""].include?(outcome) }

rules = { "101" => {} }

gestures.each do |gesture|
  50.times do |t|
    str = outcomes.shift.downcase
    verb = str.gsub(Regexp.union(gestures), '').strip
    verb_array = verb.split
    subject = str.gsub(Regexp.union(verb_array), '').strip
    if t == 0
      rules["101"][gesture.to_sym] = { subject.to_sym => verb }
    else
      rules["101"][gesture.to_sym][subject.to_sym] = verb
    end
  end
end

puts rules
