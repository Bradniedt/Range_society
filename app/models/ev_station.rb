class EvStation
  attr_reader :hours,
              :name,
              :street_address,
              :city,
              :state,
              :zip,
              :distance,
              :lat,
              :lon

  def initialize(attributes)
    @hours = attributes[:access_days_time]
    @name = attributes[:station_name]
    @street_address = attributes[:street_address]
    @city = attributes[:city]
    @state = attributes[:state]
    @zip = attributes[:zip]
    @distance = attributes[:distance]
    @lat = attributes[:latitude]
    @lon = attributes[:longitude]
  end
end
