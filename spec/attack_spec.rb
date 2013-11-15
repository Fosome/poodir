require 'spec_helper'

describe Attack do
  let(:weapon) do
    double(
      :damage => 10,
      :magic  => 0
    )
  end

  let(:attacker) do
    double(
      :strength => 1,
      :magic    => 0,
      :weapon   => weapon,
      :enraged? => false
    )
  end
  let(:attacked) do
    double(
      :health         => 11,
      :health=        => nil,
      :after_attacked => nil,
      :enraged?       => true
    )
  end

  subject { described_class.new(attacker, attacked) }

  describe "#results" do
    it "returns an array of attack results" do
      subject.results.should == [
        'Player attacks baddie for 10',
        'Player enraged!'
      ]
    end
  end
end
