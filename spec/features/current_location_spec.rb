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
    end
    context 'filling out form - clicking \'Use Current Location\' - and searching' do
      it 'show results' do
        click_button "Use Current Location"
        save_and_open_page
      end
    end
    context 'filling out form with zip code and searching' do
      xit '' do

      end
    end
  end
end
