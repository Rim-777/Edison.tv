require_relative 'acceptance_helper'


feature 'Go user page', %q{As authenticate user I want to be able to manage my albums page} do
  given!(:user) { create(:user) }
  given!(:album){create(:album, user: user, title: 'Love this photos')}
  given!(:news){create(:news, user: user, newsable: album)}

  scenario 'authenticate user is trying to manage albums page' do
    sign_in(user)

    visit user_albums_path(user)
    expect(page).to have_link 'Love this photos'
    expect(page).to have_content 'Love this photos'
    click_on 'Love this photos'
    expect(current_path).to eq user_album_path(user,album)


    visit user_albums_path(user)
    expect(page).to have_button 'My page'
    click_on 'My page'
    expect(current_path).to eq user_path(user)

    visit user_albums_path(user)
    expect(page).to have_button 'News'
    click_on 'News'
    expect(current_path).to eq root_path
  end
end
