require('pg')
require_relative('album')

class Artist

  attr_reader :id, :name

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']

  end


  def save()
    db = PG.connect({ dbname: 'Music_Collection', host: 'localhost' })
    sql = "
    INSERT INTO artist (name)
    VALUES
    ('#{@name}')
    RETURNING *" 
    @id = db.exec(sql)[0]['id'].to_i
    db.close()
  end

    def self.all() 
      db = PG.connect({ dbname: 'Music_Collection', host: 'localhost' })
      sql = "SELECT * FROM artist;"
      orders = db.exec(sql)
      db.close()
      return orders.map { |order| Artist.new(order) }
    end

  def album()
    db = PG.connect({ dbname: 'Music_Collection', host: 'localhost' })
    sql = "SELECT * FROM album WHERE artist_id = #{ @id }"
    orders = db.exec(sql)
    db.close()
    return orders.map { |order| Album.new( order ) }
  end
end
