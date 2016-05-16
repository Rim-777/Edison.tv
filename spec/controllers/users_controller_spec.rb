require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let!(:new_avatar) { File.open(Rails.root.join("public/common/test_copy.jpg")) }
  let!(:user) { create(:user, avatar: File.open(Rails.root.join("public/common/ava.png"))) }

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

    context 'User is trying update avatar' do
      let!(:request) { patch :update, {user: {avatar: new_avatar}, id: user, format: :js} }
      before { request }

      it 'assigns the requested user to @user' do
        expect(assigns(:user)).to eq user
      end

      it 'changes user attributes' do
        user.reload
        expect(user.avatar_url).to eq "/uploads/user/avatar/#{user.id}/test_copy.jpg"
      end

      it 'render show view' do
        expect(response).to render_template :update
      end
    end

    context 'User is trying update avatar without avatar' do

      it 'changes not user attributes' do
        patch :update, {user: {avatar: nil}, id: user, format: :js}
        user.reload
        expect(user.avatar_url).to eq "/uploads/user/avatar/#{user.id}/ava.png"
      end

    end

  end

  describe 'PATCH#crop_avatar' do
    let(:crop_params) { {user_id: user.id, user: {avatar_crop: {x: "0", y: "0", width: "300", height: "300"}}, "commit" => "Apply", id: user.id} }
    let(:request) { patch :crop_avatar, crop_params }
    before do
      sign_in(user)
      request
    end

    it 'render index view' do
      expect(response).to redirect_to user_path(user)
    end
  end
end
