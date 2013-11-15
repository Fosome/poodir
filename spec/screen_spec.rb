require 'spec_helper'

describe Screen do

  describe "#render" do
    it "puts the input to standard out" do
      $stdout.should_receive(:puts).with('haay')

      subject.render("haay")
    end
  end
end
