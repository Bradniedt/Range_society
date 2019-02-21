require 'rails_helper'

describe TripLog, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:miles)}
    it {should validate_presence_of(:title)}
  end
  describe 'relationships' do
    it {should belong_to(:user)}
  end
  describe 'instance methods' do
    it 'carbon_saved' do
      user = User.create(first_name: "Ricardo",
                         last_name: "Ledesma",
                         email: "ricardoledesma@mail.com",
                         token: "sdafjsd;lkfjakl;sdjf;lkasdjf",
                         refresh_token: "sdkljfa;sldkjfgioeirdijfodi",
                         role: "default",
                         status: true)
      t1 = user.trip_logs.create(title: "movies", miles: 7, description: "new quentin tarantino movie")

      expect(t1.carbon_saved).to eq(2.828)
    end
  end
end
