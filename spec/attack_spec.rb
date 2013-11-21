require 'spec_helper'

describe Attack do
  let(:attacker) do
    double(
      :attack_damage => 10,
      :to_s          => 'Jaems'
    )
  end

  let(:attacked) do
    double(
      :attack_defense  => 1,
      :health          => 10,
      :health=         => nil,
      :to_s            => 'Baddie'
    )
  end

  let(:screen) { double(:render => nil) }

  subject { described_class.new(attacker, attacked, screen) }

  describe "#execute" do
    it "performs the attack" do
      attacked.should_receive(:health=).with(1)

      subject.execute
    end
  end
end
