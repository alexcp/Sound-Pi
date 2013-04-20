require 'sequel'

if Sinatra::Base.test?
  DB = Sequel.sqlite
else
  DB = Sequel.sqlite
end

DB.create_table :songs do
  primary_key :id
  String :name
  Integer :artist_id
  Integer :album_id
  Integer :length
  String :path
  String :genre
end
