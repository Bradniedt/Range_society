require 'rails_helper'

describe 'as a logged in user, my path is search' do
  before :each do
    visit root_path
    Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
    @user_info = stub_omniauth
    click_button "Sign in With Google"
  end
  it 'i see a form with following fields' do
    user = User.first

    range = "25"
    zip = 81401
    category = "Food"

    expect(current_path).to eq(new_search_path)
    expect(page).to have_content("Your EV Range (in miles)")
    expect(page).to have_content("Zipcode")
    expect(page).to have_content("Activity")

    select("#{range}", :from => 'ev_range')
    fill_in :zipcode, with: zip
    select("#{category}", :from => 'activity')

    expect(page).to have_button("Search")
  end
  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
      "provider" => 'google_oauth2',
      "info" => {
        "name"=>"Ricardo Ledesma",
        "email"=>"ricardoledesmadev@gmail.com",
        "first_name"=>"Ricardo",
        "last_name"=>"Ledesma"
      },
      "credentials" => {
        "token"=> "ya29.GluuBlpgMeVcKRx807Vkj_iYtzXVTX3lcotXrvhpSal-CQaxNfesSclQAwrl1j7kxtCcI7O5QSRZ2kftQfmsUMBdeED9G0IysTwyRzwdqFHtwE7wRQd_LPe43JE1",
        "refresh_token"=>"1/_ilO4OLl1Bw2bPMIgc3d4YrVZ3y7wv2uc606EUyP_ag"
        }}
      )
  end
end
