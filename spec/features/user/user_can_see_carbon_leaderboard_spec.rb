require 'rails_helper'

describe 'As a visitor when i visit the root path' do
  it 'I should see a link to the carbon leaderboard.' do
    visit root_path

    expect(page).to have_link("Carbon Leaderboard")
  end
  it 'should click link and be taken to /leaderboard' do
    u1 = User.create(first_name: "Ricardo",
                         last_name: "Ledesma",
                         email: "ricardoledesma@mail.com",
                         token: "sdafjsd;lkfjakl;sdjf;lkasdjf",
                         refresh_token: "sdkljfa;sldkjfgioeirdijfodi",
                         role: "default",
                         status: true)
    u2 = User.create(first_name: "Leigh",
                         last_name: "Cepriano",
                         email: "crabapple@mail.com",
                         token: "sdafjsd;lkfjakl;sdjf;lkasdjf",
                         refresh_token: "sdkljfa;sldkjfgioeirdijfodi",
                         role: "default",
                         status: true)
    u1.trip_logs.create(title: "movies", miles: 3, description: "new quentin tarantino movie")
    u1.trip_logs.create(title: "park", miles: 4, description: "fun picnic!")
    u2.trip_logs.create(title: "bar", miles: 20, description: "great cocktails")

    visit root_path
    click_link("Carbon Leaderboard")

    expect(current_path).to eq(leaderboard_path)
    expect(page).to have_content("Top Range Society Carbon Savers")
    expect(page).to have_css("leaders", count: 2)

    within "user-1" do
      expect(page).to have_content("User: #{u1.first_name}")
      expect(page).to have_content("Carbon Saved: #{u1.carbon_saved}")
    end
    within "user-0" do
      expect(page).to have_content("User: #{u2.first_name}")
      expect(page).to have_content("Carbon Saved: #{u2.carbon_saved}")
    end
  end
end
