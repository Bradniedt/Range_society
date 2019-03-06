require 'rails_helper'

describe 'as a logged in user, my path is search' do
  before :each do
    visit root_path
    Rails.cache.clear
    Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
    @user_info = stub_omniauth
    click_button "Sign in With Google"
    click_button "Search for Locations"
  end
  it 'i see a form with following fields' do
    range = "25"
    zip = 81401

    expect(current_path).to eq(new_search_path)
    expect(page).to have_content("Your EV Range (in miles)")
    expect(page).to have_content("Enter Zip Code")
    expect(page).to have_content("Restaurants:")
    expect(page).to have_content("Museums:")
    expect(page).to have_content("Parks:")

    select(range, :from => 'ev_range')
    fill_in :search_location, with: zip
    within("#restaurants") do
      check("activities[]")
    end

    expect(page).to have_button("Search")
    click_button "Search"
    expect(current_path).to eq(map_path)
  end
end
