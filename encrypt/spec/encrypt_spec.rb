require 'rspec'
require_relative './../encrypt.rb'

describe "#encrypt" do
  it 'should transform C into Z' do
    result = encrypt('C')
    expect(result).to eq('Z')
  end

  it 'should transform E into B' do
    result = encrypt('E')
    expect(result).to eq('B')
  end

  it 'should transform THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG
      into QEB NRFZH YOLTK CLU GRJMP LSBO QEB IXWV ALD' do
    result = encrypt('THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG')
    expect(result).to eq('QEB NRFZH YOLTK CLU GRJMP LSBO QEB IXWV ALD')
  end

end
