feature 'viewing bookmarks' do
  scenario 'it shows me all the bookmarks' do
    Bookmark.create(url: 'http://www.makersacademy.com', title: "Makers")
    Bookmark.create(url: 'http://www.google.com', title: "google")
    visit('/')
    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.google.com"
  end 
end