require 'bookmark' 

describe Bookmark do 

  describe '#all' do 
    it 'returns all bookmarks' do 
      connection = PG.connect(dbname: 'bookmark_manager_test')
      Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")
      Bookmark.create(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
      Bookmark.create(url: "http://www.google.com", title: "Google")
      bookmarks = Bookmark.all
      expect(bookmarks.first.url).to eq "http://www.makersacademy.com" 
      expect(bookmarks.first). to be_a Bookmark
    end
  end

  describe "#create" do 
    it 'should add a new bookmark to the database' do 
      Bookmark.create(url: 'http://www.bbc.com', title: 'bbc')
      bookmark = Bookmark.all
      expect(bookmark.first.url).to eq 'http://www.bbc.com'
      expect(bookmark.first.title).to eq 'bbc'
    end 
  end 
end 