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
    it 'carbon_saved' do
      u1 = User.create!(first_name: "Ricardo",
                           last_name: "Ledesma",
                           email: "ricardoledesma@mail.com",
                           token: "sdafjsd;lkfjakl;sdjf;lkasdjf",
                           refresh_token: "sdkljfa;sldkjfgioeirdijfodi",
                           role: "default",
                           status: true)
      u1.trip_logs.create!(title: "movies", miles: 7, description: "new quentin tarantino movie")
      u1.trip_logs.create!(title: "bar", miles: 20, description: "great cocktails")
      answer = 10.908

      expect(u1.carbon_saved).to eq(answer)
    end
    describe "class methods" do
      it 'top_carbon_savers' do
        u1 = User.create!(first_name: "Ricardo",
                             last_name: "Ledesma",
                             email: "ricardoledesma@mail.com",
                             token: "sdafjsd;lkfjakl;sdjf;lkasdjf",
                             refresh_token: "sdkljfa;sldkjfgioeirdijfodi",
                             role: "default",
                             status: true)
        u2 = User.create!(first_name: "Leigh",
                             last_name: "Cepriano",
                             email: "crdfgs@mail.com",
                             token: "sdafwerwe;lkasdjf",
                             refresh_token: "sdkljerwerweirdijfodi",
                             role: "default",
                             status: true)
        u3 = User.create!(first_name: "mary",
                             last_name: "g",
                             email: "crfdgple@mail.com",
                             token: "sdafjsd;lkfjaksdfsdfsdfsdl;sdjf;lkasdjf",
                             refresh_token: "sdkljfa;dfs",
                             role: "default",
                             status: true)
        u1.trip_logs.create!(title: "movies", miles: 7, description: "new quentin tarantino movie")
        u2.trip_logs.create!(title: "bar", miles: 20, description: "great cocktails")
        u3.trip_logs.create!(title: "park", miles: 4, description: "fun picnic!")

        expect(User.top_carbon_savers(2)).to eq([u2, u1])
      end
    end
  end
end
