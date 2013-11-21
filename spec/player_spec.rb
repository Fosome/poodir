require 'spec_helper'

describe Player do
  subject { described_class.new(health: 100) }

  describe "#enraged?" do
    it "true if health is less that 25% max health" do
      subject.health = 24

      subject.enraged?.should == true
    end

    it "false if health is more than or equal to 25% max health" do
      subject.health = 25

      subject.enraged?.should == false
    end
  end
end
