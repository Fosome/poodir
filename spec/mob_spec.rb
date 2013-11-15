require 'spec_helper'

describe Mob do
  let(:weapon) { double() }
  subject do
    described_class.new({
      health:   100,
      strength: 2,
      magic:    5,
      weapon:   weapon
    })
  end

  its(:max_health) { should == 100 }
  its(:health)     { should == 100 }
  its(:strength)   { should == 2 }
  its(:magic)      { should == 5 }
  its(:weapon)     { should == weapon }

  its(:render)         { should == 'HP: 100' }
  its(:after_attacked) { should be_nil }

  describe "#health=" do
    it "sets the health value" do
      subject.health = 25

      subject.health.should == 25
    end

    it "caps the health at max health" do
      subject.health = 9000

      subject.health.should == 100
    end

    it "floors the health at 0" do
      subject.health = -10

      subject.health.should == 0
    end
  end

  describe "#enraged?" do
    it "returns false if the mob is not enraged" do
      subject.enraged?.should == false
    end

    it "returns true if the mob is enraged" do
      subject.instance_variable_set(:@enraged, true)

      subject.enraged?.should == true
    end
  end
end