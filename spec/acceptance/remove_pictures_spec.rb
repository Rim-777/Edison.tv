require_relative 'acceptance_helper'

feature 'Remove picture', %q{As authenticate user I want to be able to remove picture} do
  given!(:user) { create(:user) }
  given!(:other_user) { create(:user) }
  given!(:album) { create(:album, user: user, title: 'May favor album') }
  given!(:picture) do
    create(:picture,
           album: album, user: user,
           image: File.open(Rails.root.join("public/uploads/user/avatar/common/ava.png")))
  end

  describe 'remove pictures on user page' do

    scenario 'authenticate user is trying to remove album from his user page', js: true do
      sign_in(user)
      visit user_path(user)

      successfuly_remove_picture
    end

    scenario 'other authenticate user is trying to remove his not picture', js: true do
      sign_in(other_user)
      visit user_path(user)

      can_not_remove_pictures
    end

    describe 'un-authenticate user is trying to remove picture on some page' do
      before { visit user_path(user) }
      it_behaves_like "UnAuthenticate"
    end
  end

  describe 'remove pictures on album page' do
    scenario 'authenticate user is trying to remove album from his album page', js: true do
      sign_in(user)
      visit user_album_path(user, album)
      successfuly_remove_picture
    end

    scenario 'other authenticate user is trying to remove his not picture', js: true do
      sign_in(other_user)
      visit user_album_path(user, album)

      can_not_remove_pictures
    end

    describe 'un-authenticate user is trying to remove picture on some page' do
      before { visit user_album_path(user, album) }
      it_behaves_like "UnAuthenticate"
    end


  end

end

