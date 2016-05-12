require 'rails_helper'

RSpec.describe NewsPolicy do

  let(:user) { create(:user) }
  let(:news) { create(:news, user: user) }

  subject { described_class }


  permissions :create? do
    it 'grants access if user is author of poster' do
      expect(subject).to permit(user, news)
    end

    it 'denies access if user is not authenticate' do
      expect(subject).to_not permit(nil, news)
    end
  end

end
