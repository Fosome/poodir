require 'spec_helper'

describe Fight do
  let(:player) { double(:render => 'HP: 10') }
  let(:baddie) { double(:render => 'HP: 5') }
  let(:screen) { double() }

  subject do
    described_class.new(
      :screen => screen,
      :player => player,
      :baddie => baddie
    )
  end

  describe "#input" do
    let(:attack) { double() }

    it "attacks baddie with player on 1" do
      attack.should_receive(:results)
      Attack.stub(:new).with(player, baddie).and_return(attack)

      subject.input('1')
    end

    it "attacks player with baddie on 2" do
      attack.should_receive(:results)
      Attack.stub(:new).with(baddie, player).and_return(attack)

      subject.input('2')
    end

    it "does returns nothing on invalid input" do
      subject.input('pickles').should == []
    end
  end

  describe "#render" do
    it "renders the fight output" do
      subject.instance_variable_set(:@output, ['Player attacked'])

      screen.should_receive(:render).with("!! Player attacked")

      screen.should_receive(:render).with(
    <<-END
**********   Status   ****************
* 
*  Player  - HP: 10
*  Baddie  - HP: 5
*
--------------------------------------

    END
      )

      screen.should_receive(:render).with(
    <<-END
===========   Actions   ==============
|
|   1. Player attacks baddie
|   2. Baddie attacks player
|
|
|   q or quit. Exit game
|
--------------------------------------

    END
      )

      subject.render
    end
  end

  describe "#finish" do
    it "renders exit message" do
      screen.should_receive(:render).with("Exiting")

      subject.finish
    end
  end
end
