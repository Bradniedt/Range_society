class User < ApplicationRecord
  has_many :trip_logs
  has_many :user_destinations
  has_many :destinations, through: :user_destinations
  enum role: [:default, :admin]

  def self.from_omniauth(access_token)
    User.create(user_info_from_oauth(access_token))
  end

  private

  def self.user_info_from_oauth(access_token)
    {
      first_name: access_token["info"]["first_name"],
      last_name: access_token["info"]["last_name"],
      email: access_token["info"]["email"],
      token: access_token["credentials"]["token"],
      refresh_token: access_token["credentials"]["refresh_token"]
    }
  end
end
