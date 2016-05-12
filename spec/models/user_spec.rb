require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of :first_name }
  it { should have_many(:pictures).dependent(:destroy) }
  it { should have_many(:albums).dependent(:destroy) }
  it { should have_many(:news).dependent(:destroy) }
end
