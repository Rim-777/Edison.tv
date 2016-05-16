require 'rails_helper'

RSpec.describe Album, type: :model do
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :title }
  it { should have_many(:pictures).dependent(:destroy) }
  it { should have_many(:news).dependent(:destroy) }

  describe '#is_empty?' do
    let!(:user) { create(:user) }
    let!(:album) { create(:album, user: user) }
    let!(:empty_album) { create(:album, user: user) }
    let!(:picture){ create(:picture, album: album, user: user) }

    it "check if  album empty  return  true otherwise return false" do
      expect(album.is_empty?).to eq false
      expect(empty_album.is_empty?).to eq true
    end
  end
end
