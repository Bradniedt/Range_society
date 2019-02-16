class Restaurant
  attr_reader :latitude,
              :longitude,
              :name,
              :street_address,
              :city,
              :state,
              :zip_code,
              :phone,
              :distance
  def initialize(data)
    @latitude = data["coordinates"]["latitude"]
    @longitude = data["coordinates"]["longitude"]
    @name = data["name"]
    @street_address = data["location"]["address1"]
    @city = data["location"]["city"]
    @state = data["location"]["state"]
    @zip_code = data["location"]["zip_code"]
    @phone = data["phone"]
    @distance = data["distance"]
  end
end
