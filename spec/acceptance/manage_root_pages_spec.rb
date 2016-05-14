require_relative 'acceptance_helper'


feature 'Manage Root Page', %q{As authenticate user I want to be able to manage root page} do
  given!(:user) { create(:user) }
  given!(:album){create(:album, user: user)}
  given!(:news){create(:news, user: user, newsable_id: album.id, newsable_type: album.class, commentary: album.title)}

  describe 'authenticate user' do
    before{sign_in(user)}

    scenario 'authenticate user is trying to go his user page' do
      expect(page).to have_button 'my_page_button'
      click_on 'my_page_button'
      expect(current_path).to eq user_path(user)
    end

    scenario 'authenticate user is trying to go his albums page' do
      visit root_url
      expect(page).to have_button 'my_albums_button'
      click_on 'my_albums_button'
      expect(current_path).to eq user_albums_path(user)
    end

    scenario 'authenticate user is trying to go  news albums page' do
      visit root_url
      expect(page).to have_content album.title
      expect(page).to have_link album.title, href: "/users/#{user.id}/albums/#{album.id}"

      click_on album.title
      expect(current_path).to eq user_album_path(user, album)
    end
  end

  scenario 'un-authenticate user is trying to manage root page' do
    visit root_url
    expect(current_path).to eq new_user_session_path
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end
