require 'rails_helper'

describe 'as a logged in user, my path is search' do
  describe 'when i fill the search params and click search' do
    before :each do
      visit root_path
      Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
      @user_info = stub_omniauth
      click_button "Sign in With Google"
    end
    it 'i see a map populated with results of ev stations within two miles of location', :vcr do
      User.first
      range = "25"
      zip = 81401
      category = "Food"

      select("#{range}", :from => 'ev_range')
      fill_in :search_location, with: zip
      select("#{category}", :from => 'activity')
      click_on("Search")
      expect(current_path).to eq(map_path)

      lat = "39.7392"
      lon = "-104.9903"
      fill_in :ev_search_location, with: "#{lat}, #{lon}"
      click_button("Ev Search")
      expect(current_path).to eq(ev_map_path)
      expect(status_code).to eq(200)
    end
  end
end
