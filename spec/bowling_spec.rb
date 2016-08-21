require_relative '../src/bowling'

describe Bowling do
  bowling = Bowling.new

  it 'records a score of 1 when 1 pin is knocked down' do
    expect(bowling.score("1")).to eq(1)
  end

end
