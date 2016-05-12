require 'rails_helper'

RSpec.describe PicturePolicy do

  let(:user) { create(:user) }
  let(:not_author){create(:user)}
  let(:album) { create(:album, user: user) }
  let(:picture) { create(:picture, user: user, album:album) }


  subject { described_class }

  permissions :create? do
    it 'grants access if user is author of picture' do
      expect(subject).to permit(user, picture)
    end

    it 'denies access if user is not authenticate' do
      expect(subject).to_not permit(nil, picture)
    end
  end

  permissions :destroy? do
    it 'grants access if user is author of picture' do
      expect(subject).to permit(user, picture)
    end

    it 'denies access if user is not owner of picture' do
      expect(subject).to_not permit(not_author, picture)
    end

    it 'denies access if user is not authenticate' do
      expect(subject).to_not permit(nil, picture)
    end
  end
end
