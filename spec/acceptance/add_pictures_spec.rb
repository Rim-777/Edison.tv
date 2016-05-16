require_relative 'acceptance_helper'

feature 'Add pictures', %q{As authenticate user I want to be able to add pictures} do
  given(:user) { create(:user) }

  describe 'in album in user page' do
    scenario 'authenticate user is trying to add picture to his page', js: true do
      sign_in(user)
      visit user_path(user)

      page.find("#album-modal_button").trigger("click")
      fill_in 'input_title_field', with: 'SomeTitle'
      click_on 'Create'

      expect(page).to have_content 'SomeTitle'
      expect(page).to have_selector '.album'

      successfuly_attached_pictures

      expect(page).to_not have_selector '#create-album-modal'
      expect(page).to_not have_button 'Create'
      expect(page).to_not have_link 'Cancel'
      expect(page).to_not have_css 'input[type=text]'
    end
  end

  describe 'in album in album page' do
    given(:album) { create(:album, user: user, title: 'May favor album') }
    before { album }
    scenario 'authenticate user is trying to add picture to his album page', js: true do
      sign_in(user)
      visit user_album_path(user, album)

      page.find("#add_pictures_button").trigger("click")
      successfuly_attached_pictures
    end

    describe 'un-authenticate user is trying to add picture on some page' do
      before { visit user_album_path(user, album) }
      it_behaves_like "UnAuthenticate"
    end
  end
end
