require('pry')
require_relative('artist')
require_relative('album')

artist1 = Artist.new({"name" => "Grimes"})

artist1.save

album1 = Album.new({
  "title" => "Art Angels",
  "artist_id" => artist1.id
  })


album2 = Album.new({
  "title" => "Visions",
  "artist_id" => artist1.id
  })

album1.save
album2.save

binding.pry

nil