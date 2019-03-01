class GeocoderFacade
  def self.get_lat_lon(location)
    case location
    when /\d{2}\.\d{7,16} -\d{3}\.\d{7,16}/ then
      lat, lon = location.split(" ")
      return {lat: lat, lon:lon}
    when /^\d{5}\s*$/ then
      # will need to change this eventually if we want this to work nationally.
      result = service.search(location).select{ |place| place.data["address"]["state"] == "Colorado"}.first.data
      lat = result["lat"]
      lon = result["lon"]
      return {lat: lat, lon:lon}
    when /^$/ then
      return nil
    else
      return false
    end
  end

  private

  def self.service
    Geocoder
  end
end
