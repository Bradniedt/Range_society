class EvStation
  include ApplicationHelper
  attr_reader :hours,
              :name,
              :street_address,
              :city,
              :state,
              :zip,
              :distance,
              :lat,
              :lon,
              :availibility

  def initialize(attributes)
    @hours = clean_for_popup(attributes[:access_days_time])
    @name = clean_for_popup(attributes[:station_name])
    @street_address = clean_for_popup(attributes[:street_address])
    @city = "#{attributes[:city]}, #{attributes[:state]} #{attributes[:zip]}"
    @distance = attributes[:distance]
    @lat = attributes[:latitude]
    @lon = attributes[:longitude]
    @availibility = clean_for_popup(attributes[:groups_with_access_code])
  end
end
