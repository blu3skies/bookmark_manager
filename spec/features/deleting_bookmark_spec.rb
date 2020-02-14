feature 'Deleting a bookmark' do
  scenario 'A user can delete a bookmark' do
    Bookmark.create(url: 'http://www.delete.com', title: 'delete')
    visit('/')
    expect(page).to have_content('delete', 'http://www.delete.com')

    first('.bookmark').click_button 'Delete'

    # expect(current_path).to eq '/'
    expect(page).not_to have_content('delete', 'http://www.delete.com')
  end
end