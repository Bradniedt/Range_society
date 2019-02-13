require 'rails_helper'

feature "User Current Location" do
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
    context 'filling out form - clicking \'Use Current Location\' - and searching' do
      it 'show results' do
        click_button "Use Current Location"
        save_and_open_page
        expect(find_field(:search_location).value).to match(/\d{2}\.\d{7} -\d{3}\.\d{7}/)
      end
    end
    context 'filling out form with zip code and searching' do
      xit '' do
        fill_in :search_location, with: "80203"
        click_button "Search"
        expect(current_path).to eq(map_path)
      end
    end
  end
end
