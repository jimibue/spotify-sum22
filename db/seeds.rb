# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Artist.destroy_all
Song.destroy_all

brit = Artist.create(name:'Britney Spears', fans:1233123)
mj = Artist.create(name:'Mj', fans:912323123)

# create a song with the song class need the artist_id here
Song.create(name:'Hit Me Baby one more time', play_count:1234123, artist_id:brit.id)


# rails magic need to setup assiocations in rails
# create a song with a instance of artist class
brit.songs.create(name:'opps I did it again', play_count:234234)
mj.songs.create(name:'smooth criminal', play_count:234234)
mj.songs.create(name:'bad', play_count:234234)

puts Artist.all.size
puts Song.all.size
