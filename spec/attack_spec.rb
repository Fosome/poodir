require 'spec_helper'

describe Attack do
  let(:owner) do
    double(
      :attack_damage => 10,
      :to_s          => 'Jaems'
    )
  end

  let(:target) do
    double(
      :attack_defense  => 1,
      :health          => 10,
      :health=         => nil,
      :to_s            => 'Baddie'
    )
  end

  let(:screen) { double(:render => nil) }

  subject { described_class.new(owner) }

  describe "#execute" do
    it "performs the attack" do
      target.should_receive(:health=).with(1)

      subject.execute(target, screen)
    end
  end
end
