module AcceptanceMacros

  def sign_in(user)
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_on 'sign_in'
  end

  def successfuly_remove_picture
    sleep(3)

    within "#album_#{album.id}" do
      expect(page).to have_selector "#pucture_box_#{picture.id}"
    end
    expect(page).to have_link "x"
    click_on "x"
    sleep(1)

    within "#album_#{album.id}" do
      expect(page).to_not have_selector "#pucture_box_#{picture.id}"
    end
    expect(page).to_not have_selector "#pucture_box_#{picture.id}"
  end

 def can_not_remove_pictures
   within "#album_#{album.id}" do
     expect(page).to_not have_link "x"
   end
   expect(page).to_not have_link "x"
 end

  def successfuly_attached_pictures
    attach_file 'picture[image]', Rails.root.join("spec/acceptance/test_img/test1.jpg")
    attach_file 'new_picture', Rails.root.join("spec/acceptance/test_img/test2.jpg")
    expect(page).to have_link '', href: '/uploads/picture/image/1/normal_test1.jpg'
    expect(page).to have_link '', href: '/uploads/picture/image/2/normal_test2.jpg'
  end

end

