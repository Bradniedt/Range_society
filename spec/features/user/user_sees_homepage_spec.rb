require 'rails_helper'

feature 'Visiting Homepage' do
  context 'as a visitor' do
    before :each do
      visit root_path
    end
    it 'shows app name, tag line, and synopsis' do
      expect(page).to have_content("Range Society")
      expect(page).to have_content("Live Within Reach")
    end
  end
end
