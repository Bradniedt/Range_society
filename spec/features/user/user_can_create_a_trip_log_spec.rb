require 'rails_helper'

describe 'As a User' do
  before(:each) do
    visit root_path
    Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
    @user_info = stub_omniauth
    click_button 'Sign in With Google'
    visit dashboard_path
  end
  it 'can click on a link to create a new trip log' do
    click_on 'Create a Trip Log'

    expect(current_path).to eq(new_dashboard_trip_log_path)
  end
  it 'shows a form to create a new trip log' do
    click_on 'Create a Trip Log'

    expect(page).to have_content('Title')
    expect(page).to have_content('Miles')
    expect(page).to have_content('Description')
    expect(page).to have_button('Create Trip Log')
  end
  it 'creates a new trip if information has been entered correctly' do
    title = 'Trip Log 1'
    miles = 454.4
    description = 'Best Trip Ever'

    click_on 'Create a Trip Log'
    fill_in :trip_log_title, with: title
    fill_in :trip_log_miles, with: miles
    fill_in :trip_log_description, with: description
    click_on 'Create Trip Log'

    expect(current_path).to eq(dashboard_trip_logs_path)
    expect(page).to have_content('My Trips')
    expect(page).to have_content('Best Trip Ever')
    expect(page).to have_content(454.4)
    expect(page).to have_content('Trip Log 1')
  end
end
