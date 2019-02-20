require 'rails_helper'

describe User, type: :model do
  describe 'relationships' do
    it {should have_many(:trip_logs)}
  end
  describe 'instance methods' do
    it '.last_ten' do
      user = User.create(first_name: "Ricardo",
                         last_name: "Ledesma",
                         email: "ricardoledesma@mail.com",
                         token: "sdafjsd;lkfjakl;sdjf;lkasdjf",
                         refresh_token: "sdkljfa;sldkjfgioeirdijfodi",
                         role: "default",
                         status: true)
      place1 = user.destinations.create(name: "1place", location: "1location", created_at: 1.days.ago)
      place2 = user.destinations.create(name: "2place", location: "2location")
      place3 = user.destinations.create(name: "3place", location: "3location")
      place4 = user.destinations.create(name: "4place", location: "4location")
      place5 = user.destinations.create(name: "5place", location: "5location")
      place6 = user.destinations.create(name: "6place", location: "6location")
      place7 = user.destinations.create(name: "7place", location: "7location")
      place8 = user.destinations.create(name: "8place", location: "8location")
      place9 = user.destinations.create(name: "9place", location: "9location")
      place10 = user.destinations.create(name: "10place", location: "10location")
      place11 = user.destinations.create(name: "11place", location: "1l1ocation")

      expect(user.last_ten.length).to eq(10)
      expect(user.last_ten.last).to eq(place2)
      expect(user.last_ten.first).to eq(place11)
    end
  end
end
