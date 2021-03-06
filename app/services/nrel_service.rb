class NrelService
  def initialize(lat, lon)
    @lat = lat
    @lon = lon
  end

  def charging_stations_json
    JSON.parse(response.body, symbolize_names: true)[:fuel_stations]
  end

  def conn
    Faraday.new("https://developer.nrel.gov") do |faraday|
      faraday.params["api_key"] = ENV['NREL_API_KEY']
      faraday.params["fuel_type"] = "ELEC"
      faraday.params["limit"] = 20
      faraday.params["range"] = 1
      faraday.params["access"] = "public"
      faraday.params["latitude"] = @lat
      faraday.params["longitude"] = @lon
      faraday.adapter Faraday.default_adapter
    end
  end

  def response
    conn.get("/api/alt-fuel-stations/v1/nearest.json/")
  end
end
