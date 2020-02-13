require 'bookmark' 

describe Bookmark do 

  describe '#all' do 
    it 'returns all bookmarks' do 
      connection = PG.connect(dbname: 'bookmark_manager_test')
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")
      bookmarks = Bookmark.all
      expect(bookmarks).to include "http://www.makersacademy.com" 
    end
  end

  describe "#create" do 
    it 'should add a new bookmark to the database' do 
      Bookmark.create(url: 'http://www.bbc.com')
      expect(Bookmark.all).to include 'http://www.bbc.com'
    end 
  end 
end 