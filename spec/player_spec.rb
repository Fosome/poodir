require 'spec_helper'

describe Player do
  subject { described_class.new(health: 100) }

  describe "#after_attack" do
    it "sets mob to enraged if health is less that 25% max health" do
      subject.health = 24
      subject.after_attacked

      subject.enraged?.should == true
    end

    it "doesn't enraged if health is more than or equal to 25% max health" do
      subject.health = 25
      subject.after_attacked

      subject.enraged?.should == false
    end
  end
end
