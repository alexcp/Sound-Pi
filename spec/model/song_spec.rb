require 'spec_helper'

describe Song do
  it "should create a new song" do
    song = Song.create name: "test"
    song.name.should be_nil 
  end
end
