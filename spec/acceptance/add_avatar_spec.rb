require_relative 'acceptance_helper'


feature 'Add Avatar', %q{As authenticate user I want to be able to add avatar to may page} do
  given!(:user) { create(:user) }

  scenario 'authenticate user is trying to add avatar', js: true do
    sign_in(user)
    visit user_path(user)


    click_on 'avatar_link'
    attach_file 'fileupload', Rails.root.join("public/uploads/user/avatar/common/test_copy.jpg")
    click_on 'upload_avatar_button'

    within '#load-avatar-modal' do
      expect(page).to have_content user.avatar
    end

    click_on 'Apply'
    within '.avatar' do
      expect(page).to have_content user.avatar
    end

    expect(page).to_not have_selector '#load-avatar-modal'
    expect(page).to_not have_selector '#fileupload'
    expect(page).to_not have_selector '.avatar_preview'
    expect(page).to_not have_button 'upload_avatar_button'
    expect(page).to_not have_link 'Cancel'
  end

  describe 'un-authenticate user is trying to add avatar on some page' do
    before {visit user_path(user)}
    it_behaves_like "UnAuthenticate"
  end
end
