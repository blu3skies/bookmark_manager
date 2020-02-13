feature 'viewing bookmarks' do
  scenario 'it shows me all the bookmarks' do

    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com');")
    
    visit('/')
    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.google.com"
    # expect(page).to have_content "bookmark 3"
  end 
end