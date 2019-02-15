require 'rails_helper'

feature "Charge Spot Creation" do
  context 'as a visitor' do
    
  end
  As a visitor
  When I log in
   - I am still on root_path (welcome#index)
   - I don't see a button to login
   - I see a button "Search for Locations"
   - I see a button "Host Charging"
end
