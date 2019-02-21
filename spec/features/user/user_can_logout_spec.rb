require 'rails_helper'

describe 'Logout' do
  context 'as a user' do
    before(:each) do
      visit root_path
      Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
      @user_info = stub_omniauth
      click_button "Sign in With Google"
    end
    it 'after login user sees button to logout' do
      expect(page).to have_link('Logout')
    end
    it 'logs out user if clicked on and redirects to root_path' do
      click_on 'Logout'
      expect(current_path).to eq(root_path)
      expect(page).to_not have_link('Logout')
    end
  end
end
