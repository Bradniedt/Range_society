require 'rails_helper'

feature 'Google Sign In' do
  context 'as a visitor clicking \'Sign in with Google\' on homepage' do
    before :each do
      visit root_path
      Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
      stub_omniauth
      click_button "Sign in With Google"
    end
    it 'goes through oauth process' do
      expect(page).to have_content("You're logged in")
      expect(current_path).to eq(search_path)

      expect(User.count).to eq(1)
    end
    def stub_omniauth
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
        provider: 'google_oauth2',
      })
    end
  end
end
