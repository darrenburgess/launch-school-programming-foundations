def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false if dot_separated_words.size != 4
  
  dot_separated_words.each do |word|
    return false if word.to_i.to_s != word
  end

  return true
end

puts dot_separated_ip_address?("192.168.1.1")
