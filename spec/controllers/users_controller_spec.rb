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
      let!(:request){patch :update, {user: attributes_for(:user), avatar: 'qwe.gpg', id: user,  format: :js}}

      it 'assigns the requested user to @user' do
        patch :update, id: user, user: attributes_for(:user), format: :js
        expect(assigns(:user)).to eq user
      end

      it 'changes user attributes' do
        request
        user.reload
        expect(user.avatar.file).to eq new_avatar
      end
    #
    #   it 'render temlate update wiev' do
    #     patch :update, id: question, question: attributes_for(:question), format: :js
    #     expect(response).to render_template :update
    #   end
    # end
    #
    #
    # context 'User is trying update his question with invalid attributes' do
    #
    #   it 'does not change question attributes' do
    #     patch :update, id: question, question: {title: 'new title', body: nil}, format: :js
    #     question.reload
    #     expect(question.title).to eq 'OldTitleText'
    #     expect(question.body).to eq 'OldBodyText'
    #   end
    # end
    #
    #
    # context 'User is trying update his not question' do
    #
    #   it 'does not change question attributes' do
    #     sign_in(another_user)
    #     patch :update, id: question, question: {title: 'new title', body: 'new body'}, format: :js
    #     question.reload
    #     expect(question.title).to eq 'OldTitleText'
    #     expect(question.body).to eq 'OldBodyText'
    #   end
    end
    #

  end

end
