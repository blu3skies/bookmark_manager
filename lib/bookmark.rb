require 'pg'

class Bookmark
  attr_reader :id, :url, :title

  def initialize(id:, url:, title:)
    @id = id
    @url = url
    @title = title 

  end 

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect( dbname: 'bookmark_manager_test' )
    else 
      conn = PG.connect( dbname: 'bookmark_manager' )
    end 
    result = conn.exec( "SELECT * FROM bookmarks" )
    result.map do |bookmark|
      p Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
    end 
  end
  
  def self.create(url:, title:)
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect( dbname: 'bookmark_manager_test' )
    else 
      conn = PG.connect( dbname: 'bookmark_manager' )
    end 

    result = conn.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}') RETURNING id, url, title")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end 

  def self.delete(id:) 
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect( dbname: 'bookmark_manager_test' )
    else 
      conn = PG.connect( dbname: 'bookmark_manager' )
    end 
    conn.exec("DELETE FROM bookmarks WHERE id = #{id}")
  end 

end
