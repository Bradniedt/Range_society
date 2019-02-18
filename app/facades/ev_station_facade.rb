class EvStationFacade

  def initialize(lat, lon)
    @lat = lat
    @lon = lon
  end

  def all_ev_stations
    service.raw_ev_charging_stations.map do |ev_info|
      EvStation.new(ev_info)
    end
  end

  def public_ev_stations
    all_ev_stations.select do |station|
      station.availibility == "Public"
    end
  end

  def service
    NrelService.new(@lat, @lon)
  end

end
