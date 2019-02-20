require 'rails_helper'

describe 'As a User' do
  before(:each) do
    visit root_path
    Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
    @user_info = stub_omniauth
    click_button "Sign in With Google"
  end
  it 'shows dashboard' do
    visit dashboard_path
    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("#{@user_info.first_name}'s Dashboard")
    expect(page).to have_link("Create a Trip Log")
  end
  it 'shows me my ten most recent destinations' do
    user = User.last
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

    visit dashboard_path
    expect(current_path).to eq(dashboard_path)
    expect(page).to have_css('.destination', count: 10)
    within('.recent_destinations') do
      expect(page).to have_content("Most Recent Destinations:")
      expect(page).to have_content(place2.name)
      expect(page).to have_content(place3.name)
      expect(page).to have_content(place4.name)
      expect(page).to have_content(place5.name)
      expect(page).to have_content(place6.name)
      expect(page).to have_content(place7.name)
      expect(page).to have_content(place8.name)
      expect(page).to have_content(place9.name)
      expect(page).to have_content(place10.name)
      expect(page).to have_content(place11.name)
    end
  end
end
