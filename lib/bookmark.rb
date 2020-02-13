require 'pg'

class Bookmark
  attr_reader :id, :url, :title

  def initialize(id, url, title)
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
    p result = conn.exec( "SELECT * FROM bookmarks" )
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

      conn.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}')")
  end 

end
