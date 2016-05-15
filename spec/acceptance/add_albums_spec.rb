require_relative 'acceptance_helper'

feature 'Add album', %q{As authenticate user I want to be able to add new album } do
  given!(:user) { create(:user) }

  scenario 'authenticate user is trying to add avatar to his user page', js: true do
    sign_in(user)
    visit user_path(user)


    click_on 'Create Album'
    fill_in 'input_title_field', with: 'May favor album'
    click_on 'new_album_button'

    within '.albums_list' do
      expect(page).to have_link 'May favor album'
      expect(page).to have_content 'May favor album'
      expect(page).to have_content 'Title'
      expect(page).to have_content 'Share'
      expect(page).to have_content 'Remove'
      expect(page).to have_content 'upload'
      expect(page).to have_selector '.empty_album'
    end

  end

  describe 'un-authenticate user is trying to add album on some page' do
    before {visit user_path(user)}
    it_behaves_like "UnAuthenticate"
  end

end
