require 'bookmark' 
require 'database_helpers'

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
      expect(bookmarks.last.url).to eq "http://www.google.com"
    end
  end

  describe "#create" do 
    it 'should add a new bookmark to the database' do 
      bookmark = Bookmark.create(url: 'http://www.bbc.com', title: 'bbc')
      persisted_data = persisted_data(id: bookmark.id)

      expect(bookmark.url).to eq 'http://www.bbc.com'
      expect(bookmark.title).to eq 'bbc'
      expect(bookmark.id).to eq persisted_data['id']
    end 
  end 

  describe '#delete' do 
    it 'should delete the bookmark' do 
      bookmark = Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')

      Bookmark.delete(id: bookmark.id)

      expect(Bookmark.all.length).to eq 0
    end 
  end 
end 