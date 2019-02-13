require 'rails_helper'

feature 'Visiting Homepage' do
  context 'as a visitor' do
    before :each do
      visit root_path
    end
    xit 'shows app name, tag line, and synopsis' do
      expect(page).to have_content("Range Society")
      expect(page).to have_content("Live Within Reach")
      expect(page).to have_content("Discover locations and activities within your electric vehicle's range")
    end
    xit 'show a button to sign in with google' do
      expect(page).to have_button("Sign in with Google")
    end
  end
end
