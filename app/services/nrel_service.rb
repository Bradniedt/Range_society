class NrelService

  def initialize(lat, lon)
    @lat = lat
    @lon = lon
  end

  def ev_charging_stations
    conn = Faraday.new("https://developer.nrel.gov") do |faraday|
      faraday.params["api_key"] = ENV['NREL_API_KEY']
      faraday.params["fuel_type"] = "ELEC"
      faraday.params["limit"] = 25
      faraday.params["range"] = 2
      faraday.params["latitude"] = @lat
      faraday.params["longitude"] = @lon
      faraday.adapter Faraday.default_adapter
    end

    response = conn.get("/api/alt-fuel-stations/v1/nearest.json")
    ev_stations = JSON.parse(response.body, symbolize_names: true)[:fuel_stations]
    # ev_stations.each do |ev|
    #   Ev_Station.new(ev)
    # end
  end
end
