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
    expect(page).to have_content("Hello #{@user_info.first_name}")
    expect(page).to have_content("#{@user_info.first_name}'s Dashboard")
    expect(page).to have_link("Create a Trip Log")
  end
end
