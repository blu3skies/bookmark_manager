feature 'add a bookmark' do 
  scenario 'should add a bookmark to our database' do 
    visit '/'
    click_button 'Add'
    fill_in 'title', with: "fakebook"
    fill_in 'url', with: "http://www.facebook.com"
    click_button 'Add'
    expect(page).to have_content("http://www.facebook.com", "fakebook")
  end 
end 