require 'rails_helper'

describe User, type: :model do
  describe 'relationships' do
    it {should have_many(:trip_logs)}
  end
end
