require 'rails_helper'

RSpec.describe PicturesController, type: :controller do

  let!(:user) { create(:user) }
  let!(:another_user) { create(:user) }
  let!(:album) { create(:album, user: user) }

  describe 'POST #create' do
    let(:request) { post :create, {picture: attributes_for(:picture), user_id: user.id, album_id: album.id, format: :js} }


    context 'authentiacate user' do
      before { sign_in(user) }

      it 'save new pucture in database depending with album' do
        expect { request }.to change(album.pictures, :count).by(1)
      end

      it 'save new pucture in database depending with user' do
        expect { request }.to change(user.pictures, :count).by(1)
      end

      it 'render template puctures/create.js view' do
        request
        expect(response).to render_template :create
      end
    end

    context 'un-authentiacate user' do
      it 'does not save the pucture' do
        expect { request }.to_not change(Picture, :count)
      end
    end


  end

  describe 'DELETE #destroy' do
    let!(:picture) { create(:picture, user_id: user.id, album_id: album.id) }
    let(:request) { delete :destroy, {id: picture, album_id: album.id, format: :js} }

    before { picture }

    context 'authenticate user ' do
      before { sign_in(user) }
      it "remove an user's picture" do
        expect { request }.to change(Picture, :count).by(-1)
      end

      it 'render template pictures/create.js view' do
        request
        expect(response).to render_template :destroy
      end

    end

    context "Un-authenticate user is trying to remove some pucture" do
      it 'does not remove a picture' do
        expect { request }.to_not change(Picture, :count)
      end
    end
  end
end
