require_relative 'acceptance_helper'


feature 'Sign_in', %q{to manage my profile I wont to be able to sign in} do
  given!(:user) { create(:user) }
  scenario 'Registered user is trying to sign in' do
    sign_in(user)
    expect(current_path).to eq root_path
    expect(page).to have_content 'Signed in successfully'
  end
end
