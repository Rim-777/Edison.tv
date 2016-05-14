require_relative 'acceptance_helper'


feature 'Add pictures', %q{As authenticate user I want to be able to add pictures} do
  given!(:user) { create(:user) }

  scenario 'authenticate user is trying to manage his from his userpage', js: true do
    sign_in(user)
    visit user_path(user)
    page.find("#album-modal_button").trigger("click")
    fill_in 'input_title_field', with: 'SomeTitle'
    click_on 'Create'
    #
    expect(page).to have_content 'SomeTitle'
    expect(page).to have_selector '.album'

    # attach_file 'picture[image]', Rails.root.join("spec/acceptance/test_img/test1.jpg")
    # attach_file 'new_picture', Rails.root.join("spec/acceptance/test_img/test2.jpg")
    # sleep(5)
    # expect(page).to have_link '', href: '/uploads/picture/image/1/normal_test1.jpg'
    # expect(page).to have_link '', href: '/uploads/picture/image/2/normal_test2.jpg'


    expect(page).to_not have_selector '#create-album-modal'
    expect(page).to_not have_button 'Create'
    expect(page).to_not have_link 'Cancel'
    expect(page).to_not have_css 'input[type=text]'
  end


end
