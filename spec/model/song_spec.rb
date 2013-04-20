require 'spec_helper'

describe Song do
  it "should create a new song" do
    album = Album.find_or_create name: "test_album", artist: Artist.find_or_create(name:"artist")

    song = Song.create name: "test", album: album, path: "/", tracknum: 1
    song.album.should eq(album)
  end
end
