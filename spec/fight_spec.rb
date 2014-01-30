require 'spec_helper'

describe Fight do
  let(:player) do
    double('player',
      :render => 'HP: 10',
      :skills => [player_attack]
    )
  end
  let(:player_attack) do
    double('player_attack',
      :to_s => 'Attack'
    )
  end

  let(:baddie) do
    double('baddie',
      :render => 'HP: 5',
      :skills => [baddie_attack]
    )
  end
  let(:baddie_attack) do
    double('baddie_attack',
      :to_s => 'Attack'
    )
  end

  let(:screen) { double('screen') }

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
      player_attack.should_receive(:execute).with(baddie, screen)

      subject.input('1')
    end

    it "does returns nothing on invalid input" do
      screen.should_receive(:render).with('Invalid input')

      subject.input('pickles')
    end
  end

  describe "#render" do
    it "renders the fight output" do
      screen.should_receive(:render).with(
    <<-END
**********   Status   ****************
* 
*  Player  - HP: 10
*
*  Baddie  - HP: 5
*
--------------------------------------

    END
      )

      screen.should_receive(:render).with(
    <<-END
===========   Actions   ==============
|
|  - Player -
|  1. Attack
|
|  - Baddie -
|  2. Attack
|
|  q or quit. Exit game
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
