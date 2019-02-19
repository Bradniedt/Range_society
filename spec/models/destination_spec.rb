require 'rails_helper'

describe Destination, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:location) }
  end
  describe 'relationships' do
    it { should have_many(:user_destinations) }
    it { should have_many(:users).through(:user_destinations) }
  end
end
