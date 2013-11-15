require 'spec_helper'

describe Weapon do
  subject { described_class.new(type: :hammer, damage: 3, magic: 5) }

  its(:type)   { should == :hammer }
  its(:damage) { should == 3 }
  its(:magic)  { should == 5 }
end
