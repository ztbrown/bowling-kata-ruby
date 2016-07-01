require_relative '../src/bowling'

RSpec.describe Bowling, "#score" do
  bowling = Bowling.new

  (1..9).each do |pins|
    it "records a score of #{pins} when #{pins} pins are knocked down" do
      expect(bowling.score(pins.to_s)).to eq(pins)
    end
  end

  context "following a gutterball" do
    it "records a score of 0 when no pins are knocked down" do
      expect(bowling.score("-")).to eq(0)
    end

    (1..9).to_a.permutation(2).each do |pins|
      it "records a score of #{pins[0] + pins[1]} when #{pins[0]} and #{pins[1]} pins are knocked down on the next two rolls" do
        expect(bowling.score("-#{pins[0].to_s}#{pins[1].to_s}")).to eq(pins[0] + pins[1])
      end
    end
  end

  context 'following a strike' do
    (1..9).to_a.permutation(2).each do |pins|
      it "records a score of #{pins[0] + pins[1] + (10 + pins[0] + pins[1])} when #{pins[0]} and #{pins[1]} pins are knocked down on the next two rolls" do
        expect(bowling.score("X#{pins[0].to_s}#{pins[1].to_s}")).to eq(pins[0] + pins[1] + (10 + pins[0] + pins[1]))
      end
    end

    it "records a score of 60 for 3 strikes" do
      expect(bowling.score("XXX")).to eq(60)
    end

    it "records a score of 30 for a spare following a strike" do
      expect(bowling.score("X/")).to eq(30)
    end

    it "records a score of 300 for a perfect game" do
      expect(bowling.score("XXXXXXXXXXXX")).to eq(300)
    end

    it "records a score of 274 for a near-perfect game" do
      expect(bowling.score("XXXXXXXXXX12")).to eq(274)
    end
  end

  context 'following a spare' do
    (1..9).each do |pins|
      it "records a score of #{pins + pins + 10} when #{pins} pins are knocked down on the next frame" do
        expect(bowling.score("/#{pins.to_s}")).to eq(pins + pins + 10)
      end
    end
  end
end
