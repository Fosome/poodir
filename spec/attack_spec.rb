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
      :to_s           => 'Baddie',
      :health         => 100,
      :health=        => nil,
      :after_attacked => nil,
      :enraged?       => true
    )
  end

  let(:screen) { double(:render => nil) }

  subject { described_class.new(attacker, attacked, screen) }

  describe "#execute" do
    it "performs the attack" do
      screen.should_receive(:render).with("Jaems attacks Baddie for 10 damage")

      subject.execute
    end

    it "performs the after attack" do
      screen.should_receive(:render).with("Baddie enraged!")

      subject.execute
    end
  end
end
