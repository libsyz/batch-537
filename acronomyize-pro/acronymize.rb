
STOP_WORDS = ["of","the","and"]

def acronymize(sentence)
  raise StandardError unless sentence.is_a? String
  sentence.split
          .map { |word| !STOP_WORDS.include?(word) ? word[0].upcase : nil }
          .compact
          .join(".") + "."
end
