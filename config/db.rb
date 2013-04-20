require 'sequel'

if Sinatra::Base.test?
  DB = Sequel.sqlite
else
  DB = Sequel.sqlite('songpi.db')
end

DB.create_table? :songs do
  primary_key :id
  String :name
  Integer :album_id
  Integer :tracknum
  String :path
  String :genre
end

DB.create_table? :albums do
  primary_key :id
  String :name
  Integer :artist_id
end

DB.create_table? :artists do
  primary_key :id
  String :name
end
