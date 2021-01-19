require 'rspec'
require './../acronymize.rb'

describe "#acronymize" do
  it "should return the capitalized first letter of a sentence" do
    result = acronymize('cash rules everything around me')
    expect(result).to eq('C.R.E.A.M.')
  end

  it "should not include stop words like of, a or the" do
    result = acronymize('Federal Bureau of Investigation')
    expect(result).to eq('F.B.I.')
  end
end


# TDD Cycle

# Red - My test is not passing, hopefully the error gives me signal on what to do next - done
# Green - I work to pass the test - done
# Refactor - I make the code tidier, better, easier to read
