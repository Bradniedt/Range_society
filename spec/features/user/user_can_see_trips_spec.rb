require 'rails_helper'

describe 'as a logged in user, my path is search' do
  describe 'when i fill the search params and click search' do
    before :each do
      visit root_path
      Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
      @user_info = stub_omniauth
      click_button "Sign in With Google"
    end
    it 'should see all of my trips listed, along with the carbon saved for each trip.' do
      user = User.last
      t1 = user.trip_logs.create(title: "movies", miles: 7, description: "new quentin tarantino movie")
      t2 = user.trip_logs.create(title: "visit mom", miles: 25, description: "drove out to visit my mom")
      visit dashboard_path
      expect(page).to have_link("My Trips")
      click_on("My Trips")

      expect(current_path).to eq(dashboard_trip_logs_path)
      expect(page).to have_content("My Trips")
      expect(page).to have_css("#trip-log", count: 2)
      within('.my-trips') do
        expect(page).to have_content(t1.title)
        expect(page).to have_content(t1.miles)
        expect(page).to have_content(t1.description)
        expect(page).to have_content(t1.carbon_saved)
        expect(page).to have_content(t2.title)
        expect(page).to have_content(t2.miles)
        expect(page).to have_content(t2.description)
        expect(page).to have_content(t2.carbon_saved)
      end
    end
  end
end
