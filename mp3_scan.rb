require_relative 'app'
require 'find'
require 'mp3info'

Dir.chdir MUSIC_DIR

Find.find('./') do |path|
  if path.match(/\.mp3$/)
    Mp3Info.open(path) do |file|

      artist = Artist.find_or_create(name: file.tag.artist)
      artist = Artist.find_or_create(name: "not availaible") unless artist

      album = Album.find_or_create name: file.tag.album,
                                   artist: artist
      album = Artist.find_or_create(name: "not availaible") unless album

      Song.create name: file.tag.title,
                  album: album,
                  path: "#{MUSIC_DIR}#{path[1..-1]}",
                  tracknum: file.tag.tracknum,
                  genre: file.tag.genre_s
    end
  end
end
