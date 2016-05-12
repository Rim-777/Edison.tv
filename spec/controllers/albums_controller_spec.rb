require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do

  let(:user) { create(:user) }
  let(:album) { create(:album, user: user) }
  let(:another_user) { create(:user) }


  describe 'GET #index' do
    let!(:albums) { create_list(:album, 2, user: user) }

    before do
      sign_in(user)
      get :index, user_id: user.id
    end

    it "populates an array of all user's albums" do
      expect(assigns(:albums)).to match_array(albums)
    end

    it 'render index view' do
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do

    before do
      sign_in(user)
      get :show, id: album, user_id: user.id
    end


    it 'assigns the requested album to @album' do
      expect(assigns(:album)).to eq album
    end

    it 'render show view' do
      expect(response).to render_template :show
    end
  end

  describe 'POST #create' do
    let(:request) { post :create, user_id: user.id, album: attributes_for(:album), format: :js }

    describe 'authentiacate user' do
      before { sign_in(user) }

      context 'with valid attributes' do
        it 'save new album in database depending with album' do
          expect { request }.to change(user.albums, :count).by(1)
        end

        it 'render template albums/create.js view' do
          request
          expect(response).to render_template :create
        end
      end

      context 'with invalid attributes' do
        let(:invalid_request) { post :create, user_id: user.id, album: attributes_for(:invalid_album), format: :js }
        it 'does not save the album' do
          expect { invalid_request }.to_not change(Album, :count)
        end

        it 'render template Answers/create.js view' do
          invalid_request
          expect(response).to render_template :create
        end
      end
    end

    context 'Un-authenticate user' do
      it 'save new album in database depending with album' do
        expect { request }.to_not change(Album, :count)
      end
    end

  end

  describe 'DELETE #destroy' do
    let(:request) { delete :destroy, user_id: user.id, id: album, format: :js }

    before { album }

    context 'authenticate user' do
      before { sign_in(user) }
      it "remove an user's album" do
        expect { request }.to change(user.albums, :count).by(-1)
      end

      it 'render template albums/create.js view' do
        request
        expect(response).to render_template :destroy
      end
    end

    context "Un-authenticate user is trying to remove some album" do
      it 'does not remove a album' do
        expect { request }.to_not change(Album, :count)
      end
    end
  end
end

