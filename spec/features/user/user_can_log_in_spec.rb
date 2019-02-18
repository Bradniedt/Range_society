require 'rails_helper'

feature 'Login' do
  context 'as a visitor (new user) clicking \'Sign in with Google\' on homepage' do
    it 'goes through oauth process, creates a user, and redirects back to root_path' do
      visit root_path
      Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
      @user_info = stub_omniauth
      click_button "Sign in With Google"

      expect(page).to have_content("You're logged in Ricardo")
      expect(current_path).to eq(root_path)
      created_user = User.first

      expect(User.count).to eq(1)
      expect(created_user.first_name).to eq(@user_info["info"]["first_name"])
      expect(created_user.last_name).to eq(@user_info["info"]["last_name"])
      expect(created_user.email).to eq(@user_info["info"]["email"])
      expect(created_user.token).to eq(@user_info["credentials"]["token"])
      expect(created_user.refresh_token).to eq(@user_info["credentials"]["refresh_token"])
      
      expect(current_path).to eq(root_path)
      expect(page).to_not have_button("Sign in With Google")
      expect(page).to have_button("Search for Locations")
      expect(page).to have_button("Host Charging")
    end
  end
  context 'as a visitor (has account) clicking \'Sign in with Google\' on homepage' do
    it 'goes through oauth process, redirects to dashboard_path' do
      User.create(
        email: "ricardoledesma@mail.com",
        first_name: "Ricardo",
        last_name: "Ledesma",
        token: "sdafjsd;lkfjakl;sdjf;lkasdjf",
        refresh_token: "sdkljfa;sldkjfgioeirdijfodi"
      )
      expect(User.count).to eq(1)
      visit root_path
      Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
      @user_info = stub_omniauth
      click_button "Sign in With Google"

      expect(page).to have_content("You're logged in Ricardo")
      expect(current_path).to eq(dashboard_path)

      expect(User.count).to eq(1)
    end
  end
end
