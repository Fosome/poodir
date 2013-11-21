require 'spec_helper'

describe Armor do

  subject do
    described_class.new(
      :type    => :leather,
      :defense => 5
    )
  end

  its(:type)    { should == :leather }
  its(:defense) { should == 5 }
end
