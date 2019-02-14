require 'rails_helper'

describe 'as a logged in user, my path is search' do
  it 'shows all search fields' do
    user = User.create(
      first_name: 'Jon',
      last_name: 'Smith',
      email: 'jon@gmail.com',
      token: 'asdahdhgs',
      refresh_token: 'sadshga2231')

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit new_search_path
    save_and_open_page
    expect(page).to have_select(:ev_range)
    expect(find_field("activity-food").value).to eq('food')
    expect(find_field("activity-entertainment").value).to eq('entertainment')
    expect(find_field("activity-culture").value).to eq('culture')
    expect(find_field("activity-outdoors").value).to eq('outdoors')
    expect(find_field("activity-all").value).to eq('all')
    expect(page).to have_field('search-location')
#     - I see a series of radio buttons for possible activities to include in search
#    * Food
#    * Entertainment
#    * Culture
#    * Outdoors
#    * Select all
# - Input field to enter zip code

    # radio_button_tag(name, value, checked = false, options = {}) public

    # radio_button_tag 'color', "green", true, class: "color_input"
    # => <input checked="checked" class="color_input" id="color_green" name="color" type="radio" value="green" />
  end
  describe 'when i fill the search params and click search' do
    before :each do
      visit root_path
      Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
      @user_info = stub_omniauth
      click_button "Sign in With Google"
    end
    it 'i see a map populated with results from the activity chosen' do
      VCR.use_cassette('map') do
        user = User.first

        range = "25"
        zip = 81401
        category = "Food"

        select("#{range}", :from => 'ev_range')
        fill_in :search_location, with: zip
        select("#{category}", :from => 'activity')
        click_on("Search")
        expect(current_path).to eq(map_path)
        expect(status_code).to eq(200)
      end
    end
  end
end
