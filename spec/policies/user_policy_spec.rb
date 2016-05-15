require 'rails_helper'

RSpec.describe UserPolicy do

  let(:user) { create(:user) }
  subject { described_class }

  permissions :update? do
    it 'grants access if user is owner of acount' do
      expect(subject).to permit(user, user)
    end

    it 'denies access if user is not authenticate' do
      expect(subject).to_not permit(nil, user)
    end
  end
end
