require 'rails_helper'

describe 'As a User' do
  before(:each) do
    visit root_path
    Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
    @user_info = stub_omniauth
    click_button "Sign in With Google"
    visit dashboard_path
  end
  it 'can click on a link to create a new trip log' do
    click_on "Create a Trip Log"

    expect(current_path).to eq(new_trip_log_path)
  end
  xit 'shows a form to create a new trip log' do


    click_on "Create a Trip Log"


  end
end
