require('pg')
require_relative('sql_runner')

class Album 

attr_reader :title, :id, :artist_id

  def initialize(options)
    @title = options['title']
    @id = options['id'].to_i
    @artist_id = options['artist_id'].to_i
  end


  def save()
    db = PG.connect({ dbname: 'Music_Collection', host: 'localhost' })
    sql = "
    INSERT INTO album (title, artist_id)
    VALUES
    ('#{@title}', #{@artist_id})
    RETURNING *" 
    @id = db.exec(sql)[0]['id'].to_i
    db.close()
  end

  def self.all() 
    db = PG.connect({ dbname: 'Music_Collection', host: 'localhost' })
    sql = "SELECT * FROM album;"
    orders = db.exec(sql)
    db.close()
    return orders.map { |order| Album.new(order) }
  end


  def artist()
    db = PG.connect({ dbname: 'Music_Collection', host: 'localhost' })
    sql = "SELECT * FROM artist WHERE id = #{ @artist_id }"
    orders = db.exec(sql)
    db.close()
    return orders.map { |order| Artist.new( order ) }
   end
end
