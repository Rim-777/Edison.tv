require_relative 'acceptance_helper'


feature 'Go user page', %q{As authenticate user I want to be able to manage my page} do
  given!(:user) { create(:user) }
  given!(:album){create(:album, user: user)}
  given!(:news){create(:news, user: user, newsable: album)}

  scenario 'authenticate user is trying to manage album page' do
    sign_in(user)



  end


end
