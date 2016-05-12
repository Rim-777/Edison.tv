require 'rails_helper'

RSpec.describe NewsController, type: :controller do
  let(:user) { create(:user) }
  let(:all_news) { create(:news, user: user) }
  let!(:album) { create(:album, user_id: user.id) }
  let(:another_user) { create(:user) }


  describe 'GET #index' do
    before { sign_in(user) }
    let!(:news) { create_list(:news, 2, user: user) }
    before { get :index, user_id: user.id }

    it "populates an array of all user's albums" do
      expect(assigns(:news)).to match_array(news)
    end

    it 'render index view' do
      expect(response).to render_template :index
    end
  end


  describe 'POST #create' do

    let(:request) { post :create, {news: attributes_for(:news),  album_id: album.id, user_id: user.id, format: :js} }

    context 'authenticate user' do

      before { sign_in(user) }

      it 'save new news in database for user' do
        expect { request }.to change(user.news, :count).by(1)
      end

      it 'save new news in database for album' do
        expect { request }.to change(News, :count).by(1)
      end

      it 'render template albums/create.js view' do
        request
        expect(response).to render_template :create
      end
    end

    context 'un-authenticate user' do
      it 'does not save the news' do
        expect { request }.to_not change(News, :count)
      end
    end
  end
end
