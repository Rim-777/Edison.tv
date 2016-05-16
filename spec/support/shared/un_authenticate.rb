shared_examples_for 'UnAuthenticate'  do
  scenario 'un-authenticate user' do
    expect(current_path).to eq new_user_session_path
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end
