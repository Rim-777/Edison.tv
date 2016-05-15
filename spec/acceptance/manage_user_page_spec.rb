require_relative 'acceptance_helper'


feature 'Go user page', %q{As authenticate user I want to be able to manage my page} do
  given!(:user) { create(:user) }
  given!(:album) { create(:album, user: user) }
  given!(:news) { create(:news, user: user, newsable: album) }

  scenario 'authenticate user is trying to manage his user page', js: true do
    sign_in(user)
    expect(page).to have_button 'my_page_button'
    click_on 'my_page_button'

    expect(current_path).to eq user_path(user)
    expect(page).to have_content user.first_name
    expect(page).to have_content album.title
    expect(page).to have_link album.title, href: "/users/#{user.id}/albums/#{album.id}"
    expect(page).to have_link 'Create Album'
    expect(page).to have_link 'Create Album'
    expect(page).to have_link 'Albums'
    expect(page).to have_link 'News'
    expect(page).to have_link 'avatar_link'
    expect(page).to have_selector '.albums_list'
    expect(page).to have_selector '.avatar'

    click_on 'avatar_link'
    expect(page).to have_selector '#load-avatar-modal'
    expect(page).to have_selector '#fileupload'
    expect(page).to have_selector '.avatar_preview'
    expect(page).to have_button 'upload_avatar_button'
    expect(page).to have_link 'Cancel'

    click_on 'Cancel'
    expect(page).to_not have_selector '#load-avatar-modal'
    expect(page).to_not have_selector '#fileupload'
    expect(page).to_not have_selector '.avatar_preview'
    expect(page).to_not have_button 'upload_avatar_button'
    expect(page).to_not have_link 'Cancel'

    page.find("#album-modal_button").trigger("click")
    expect(page).to have_selector '#create-album-modal'
    expect(page).to have_button 'Create'
    expect(page).to have_link 'Cancel'
    expect(page).to have_css 'input[type=text]'

    click_on 'Cancel'
    expect(page).to_not have_selector '#create-album-modal'
    expect(page).to_not have_button 'Create'
    expect(page).to_not have_link 'Cancel'
    expect(page).to_not have_css 'input[type=text]'


    click_on album.title
    expect(current_path).to eq user_album_path(user, album)
  end

  describe 'un-authenticate user is trying to manage some user page' do
    before { visit user_path(user) }
    it_behaves_like "UnAuthenticate"
  end


end
