require 'rails_helper'

RSpec.describe News, type: :model do
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :commentary }
  it { should belong_to(:user) }
  it { should belong_to(:newsable) }
end
