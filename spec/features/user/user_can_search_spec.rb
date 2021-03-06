require 'rails_helper'

describe 'as a logged in user, my path is search' do
  describe 'when i fill the search params and click search' do
    before :each do
      visit root_path
      Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
      @user_info = stub_omniauth
      click_button "Sign in With Google"
      click_button "Search for Locations"
    end
    it 'i see a map populated with results from the activity chosen' do
      VCR.use_cassette('map') do
        User.first
        range = "25"
        zip = 81401

        select(range, :from => :ev_range)
        fill_in :search_location, with: zip
        within("#museums") do
          check("activities[]")
        end
        click_on("Search")
        expect(current_path).to eq(map_path)
        expect(status_code).to eq(200)
      end
    end
  end
end
