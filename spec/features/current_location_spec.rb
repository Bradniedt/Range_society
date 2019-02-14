require 'rails_helper'

feature "User Location Search" do
  context 'as a logged in user on search path' do
    before :each do
      user = User.create(
        first_name: 'Jon',
        last_name: 'Smith',
        email: 'jon@gmail.com',
        token: 'asdahdhgs',
        refresh_token: 'sadshga2231')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit new_search_path

      select "5", from: :ev_range
      select "Food", from: :activity
    end
    context 'filling out form - with lat and lon - and searching' do
      it 'redirects and shows results' do
        lat = "39.7251165"
        lon = "-104.985933178656"
        fill_in :search_location, with: "#{lat} #{lon}"
        click_button "Search"
        expect(current_path).to eq(map_path)
      end
    end
    context 'filling out form with zip code and searching' do
      it 'redirects and show results' do
        fill_in :search_location, with: "80203"
        click_button "Search"
        expect(current_path).to eq(map_path)
      end
    end
    context 'filling out form without zip code and searching' do
      it 'redirects with proper flash message' do
        click_button "Search"
        expect(current_path).to eq(new_search_path)
        expect(page).to have_content('Zip Code must be entered or press \'Use Current Location\'')
      end
    end
    context 'filling out form with invalid input for zip code and searching' do
      it 'redirects with proper flash message' do
        fill_in :search_location, with: "Platform 9 3/4"
        click_button "Search"
        expect(current_path).to eq(new_search_path)
        expect(page).to have_content('Invalid Zip Code - try again or press \'Use Current Location\'')
      end
    end
  end
end
