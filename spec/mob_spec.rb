require 'spec_helper'

describe Mob do
  let(:weapon) do
    double(
      :damage => 2,
      :magic  => 1
    )
  end

  let(:armor) do
    double(
      :defense => 2
    )
  end

  subject do
    described_class.new({
      :name     => 'Jaems',
      :health   => 100,
      :strength => 2,
      :magic    => 5,
      :weapon   => weapon,
      :armor    => armor
    })
  end

  its(:name)       { should == 'Jaems' }
  its(:max_health) { should == 100 }
  its(:health)     { should == 100 }
  its(:strength)   { should == 2 }
  its(:magic)      { should == 5 }

  its(:weapon) { should == weapon }
  its(:armor)  { should == armor }

  its(:to_s)   { should == 'Jaems' }

  its(:enraged?) { should == false }

  describe "#render" do
    it "shows the mob health" do
      subject.render.should == "HP: 100"
    end

    it "shows enraged status" do
      subject.stub(:enraged?).and_return(true) #kinda sadface

      subject.render.should == "HP: 100, Enraged"
    end

    it "shows death status" do
      subject.health = 0

      subject.render.should == "HP: 0, Dead"
    end
  end

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

  describe "#attack_damage" do
    it "returns a damage calculation" do
      subject.attack_damage.should == 9
    end

    it "probably does more testing" do
      pending
    end
  end
end
