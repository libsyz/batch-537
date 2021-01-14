
def encrypt(sentence)
  # check if the sentence is a string
  # set an array of letters from A-Z ( upcase ) = maybe use range
  # change sentence to upcase
  # split the sentence into letters
  # array of letters ( and some spaces ) ["M", "Y", " ", "..." ]
  # iterate through the array
  # -> for each element
  # match it to the alphabet array with an index of -3
  ### find the index in the alphabet array where the letter sits ("C" -> 2)
  ### get the value that sits at index -1 in the alphabet array
  # join the array
  # return the string!!
  # we're done!
  # YAY!
  # HOME!!!
  raise StandardError unless sentence.is_a? String
  alphabet = ("A".."Z").to_a
  sentence.upcase!
  spleet = sentence.split("")
  cryptic = spleet.map do |letter|
    letter == " " ? " " : alphabet[alphabet.find_index(letter) - 3]
  end
  cryptic.join
end
