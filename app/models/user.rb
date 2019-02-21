class User < ApplicationRecord
  has_many :trip_logs
  has_many :user_destinations
  has_many :destinations, through: :user_destinations
  enum role: [:default, :admin]

  def self.from_omniauth(access_token)
    User.create(user_info_from_oauth(access_token))
  end

  def last_ten
    destinations.order(created_at: :desc).limit(10)
  end

  def self.top_carbon_savers(limit = 10)
    User.joins(:trip_logs).select("users.*, sum(trip_logs.miles) as carbon_saved").group("users.id").order("carbon_saved desc").limit(limit)
  end

  def carbon_saved
    (((self.trip_logs.sum(:miles)) * 404.0) / 1000).round(3)
  end

  def average_trip
    ((self.trip_logs.sum(:miles)) / self.trip_logs.size).round(3)
  end

  def average_carbon
    ((((self.trip_logs.sum(:miles)) * 404) / 1000) / self.trip_logs.size).round(3)
  end

  def total_trip
    self.trip_logs.sum(:miles)
  end

  def total_carbon
    ((self.trip_logs.sum(:miles) * 404) / 1000).round(3)
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
