require 'rails_helper'

describe 'as a visitor' do
  it 'when I click on the About link, I see an explaination of the app' do
    visit '/about'

    expect(page).to have_content("Around 98% of all single-trip journeys")
    expect(page).to have_content("Join us at Range Society, and discover the possibilities within your range.")
  end
end
