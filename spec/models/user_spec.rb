require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of :first_name }
  it { should have_many(:pictures).dependent(:destroy) }
  it { should have_many(:albums).dependent(:destroy) }
  it { should have_many(:news).dependent(:destroy) }

  describe '#crop_avatar!' do
    let!(:user) { create(:user, avatar:  File.open("#{Rails.root}/public/uploads/user/avatar/common/ava.png")) }
    let!(:coordinates) { {x: '0', y: '0', width: '300', height: '300'} }
    let!(:new_values) { {x: 0, y: 0, width: 300, height: 300} }

    it 'change type of coordinates to integer' do
      user.crop_avatar!(coordinates)
      expect(user.avatar_crop).to eq new_values
    end

    it 'should  receive crop_avatar! for user' do
      expect(user.avatar).to receive(:recreate_versions!)
      user.crop_avatar!(coordinates)
    end

  end
end
