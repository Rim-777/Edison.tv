require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let!(:user){create(:user)}
  let!(:new_avatar){'/new avatar/'}

  describe 'GET #show' do

    before do
      sign_in(user)
      get :show, id: user
    end

    it 'render show view' do
      expect(response).to render_template :show
    end
  end



  describe 'PATCH #update' do
    before { sign_in(user) }

    context 'User is trying update him-self' do
      let!(:request){patch :update, {user: attributes_for(:user), avatar: new_avatar, id: user,  format: :js}}

      it 'assigns the requested user to @user' do
        patch :update, id: user, user: attributes_for(:user), format: :js
        expect(assigns(:user)).to eq user
      end

      it 'changes user attributes' do
        request
        user.reload
        expect(user.avatar_url).to eq new_avatar
      end

    end


  end

end
