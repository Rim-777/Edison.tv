require_relative 'acceptance_helper'

require_relative 'acceptance_helper'

feature 'Add album', %q{As authenticate user I want to be able to add new album } do
  given!(:user) { create(:user) }
  given!(:other_user) { create(:user) }
  given!(:album) { create(:album, user: user, title: 'May favor album') }
  given!(:album) { create(:album, user: user, title: 'May favor album') }


  scenario 'authenticate user is trying to remove album from his user page', js: true do
    sign_in(user)
    visit user_path(user)

    click_on "remove_album_#{album.id}_link"
    within '.albums_list' do
      expect(page).to_not have_link 'May favor album'
      expect(page).to_not have_content 'May favor album'
      expect(page).to_not have_content 'Title'
      expect(page).to_not have_content 'Share'
      expect(page).to_not have_content 'Remove'
      expect(page).to_not have_content 'upload'
      expect(page).to_not have_selector "album_#{album.id}"
    end

  end

  scenario 'other authenticate user is trying to remove his not album', js: true do
    sign_in(other_user)
    visit user_path(user)

    within '.albums_list' do
      expect(page).to_not have_link "remove_album_#{album.id}_link"
    end

  end
  describe 'un-authenticate user is trying to remove album on some page' do
    before {visit user_path(user)}
    it_behaves_like "UnAuthenticate"
  end

end
