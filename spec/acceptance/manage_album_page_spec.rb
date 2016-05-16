require_relative 'acceptance_helper'


feature 'Go user page', %q{As authenticate user I want to be able to manage my album page} do
  given!(:user) { create(:user) }
  given!(:album){create(:album, user: user, title:'Love this photos' )}
  given!(:news){create(:news, user: user, newsable: album)}

  scenario 'authenticate user is trying to manage album page'do
    sign_in(user)

    visit user_album_path(user, album)
    expect(page).to have_content 'Love this photos'

    visit user_album_path(user, album)
    expect(page).to have_button 'My Page'
    click_on 'My Page'
    expect(current_path).to eq user_path(user)

    visit user_album_path(user, album)
    expect(page).to have_button 'News'
    click_on 'News'
    expect(current_path).to eq root_path
  end
end
