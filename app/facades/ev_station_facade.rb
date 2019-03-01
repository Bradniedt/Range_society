class EvStationFacade
  attr_reader :lat, :lon
  def initialize(lat, lon, popup_html=nil)
    @lat = lat
    @lon = lon
    @popup_html = popup_html
  end

  def self.from_internal_request(request)
    picked_location = JSON.parse(request, symbolize_names: true)
    latitude, longitude = picked_location[:coordinates].split(" ")
    new(latitude, longitude, picked_location[:popup_html])
  end

  def stations
    stations = Cache.get_stations(@lat, @lon)
    unless stations
      stations = make_stations(service.charging_stations_json)
      Cache.write(ev_stations: stations, ev_lat: @lat, ev_lon: @lon)
    end
    stations
  end

  def service
    NrelService.new(@lat, @lon)
  end

  def popup_html
    @popup_html.gsub("\"", '\'').html_safe if @popup_html
  end

  private

  def make_stations(stations)
    stations.map do |raw_station|
      EvStation.new(raw_station)
    end
  end
end
