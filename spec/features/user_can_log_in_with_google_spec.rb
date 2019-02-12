require 'rails_helper'

feature 'Google Sign In' do
  context 'as a visitor clicking \'Sign in with Google\' on homepage' do
    before :each do
      visit root_path
      Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
      @user_info = stub_omniauth
      click_button "Sign in With Google"
    end
    it 'goes through oauth process' do
      expect(page).to have_content("You're logged in")
      expect(current_path).to eq(search_path)
      created_user = User.first

      expect(User.count).to eq(1)
      expect(created_user.first_name).to eq(@user_info["info"]["first_name"])
      expect(created_user.last_name).to eq(@user_info["info"]["last_name"])
      expect(created_user.email).to eq(@user_info["info"]["email"])
      expect(created_user.refresh_token).to eq(@user_info["credentials"]["token"])
      expect(created_user.token).to eq(@user_info["credentials"]["refresh_token"])
    end
    def stub_omniauth
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
        "provider" => 'google_oauth2',
        "info" => {
          "name"=>"Ricardo Ledesma",
          "email"=>"ricardoledesmadev@gmail.com",
          "first_name"=>"Ricardo",
          "last_name"=>"Ledesma"
        },
        "credentials" => {
          "token"=> "ya29.GluuBlpgMeVcKRx807Vkj_iYtzXVTX3lcotXrvhpSal-CQaxNfesSclQAwrl1j7kxtCcI7O5QSRZ2kftQfmsUMBdeED9G0IysTwyRzwdqFHtwE7wRQd_LPe43JE1",
          "refresh_token"=>"1/_ilO4OLl1Bw2bPMIgc3d4YrVZ3y7wv2uc606EUyP_ag"
        }}
      )
    end
  end
end
