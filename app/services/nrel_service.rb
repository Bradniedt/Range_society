class NrelService

  def initialize(lat, lon)
    @lat = lat
    @lon = lon
  end

  def raw_ev_charging_stations
    JSON.parse(response.body, symbolize_names: true)[:fuel_stations]
  end

  def ev_charging_stations
    raw_ev_charging_stations.map do |ev|
      EvStation.new(ev)
    end
  end

  def conn
    Faraday.new("https://developer.nrel.gov") do |faraday|
      faraday.params["api_key"] = ENV['NREL_API_KEY']
      faraday.params["fuel_type"] = "ELEC"
      faraday.params["limit"] = 25
      faraday.params["range"] = 2
      faraday.params["latitude"] = @lat
      faraday.params["longitude"] = @lon
      faraday.adapter Faraday.default_adapter
    end
  end

  def response
    conn.get("/api/alt-fuel-stations/v1/nearest.json/")
  end

end
