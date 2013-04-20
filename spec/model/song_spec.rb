require 'spec_helper'

describe Song do
  it "should create a new song" do
    album = Album.create name: "test_album", artist: Artist.create(name:"artist")
    song = Song.create name: "test", album: album, path: "/", length: 120
    song.album.should eq(album)
  end
end
