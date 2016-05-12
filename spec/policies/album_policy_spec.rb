require 'rails_helper'

RSpec.describe AlbumPolicy do

  let(:user) { create(:user) }
  let(:not_author){create(:user)}
  let(:album) { create(:album, user: user) }

  subject { described_class }

  permissions :create? do
    it 'grants access if user is author of poster' do
      expect(subject).to permit(user, album)
    end

    it 'denies access if user is not authenticate' do
      expect(subject).to_not permit(nil, album)
    end
  end

  permissions :destroy? do
    it 'grants access if user is author of album' do
      expect(subject).to permit(user, album)
    end

    it 'denies access if user is not owner of album' do
      expect(subject).to_not permit(not_author, album)
    end

    it 'denies access if user is not authenticate' do
      expect(subject).to_not permit(nil, album)
    end
  end
end
