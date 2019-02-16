require 'rails_helper'

describe NrelService do
  it 'exists', :vcr do
    lat = "39.7392"
    lon = "-104.9903"
    ns = NrelService.new(lat, lon)

    expect(ns).to be_a(NrelService)
  end
  describe '#instance methods' do
    it 'raw_ev_charging_stations', :vcr do
      lat = "39.7392"
      lon = "-104.9903"
      ns = NrelService.new(lat, lon)
      count = 20

      expect(ns.raw_ev_charging_stations.count).to eq(count)
      expect(ns.raw_ev_charging_stations.first).to have_key(:access_days_time)
      expect(ns.raw_ev_charging_stations.first).to have_key(:station_name)
      expect(ns.raw_ev_charging_stations.first).to have_key(:street_address)
      expect(ns.raw_ev_charging_stations.first).to have_key(:city)
      expect(ns.raw_ev_charging_stations.first).to have_key(:state)
      expect(ns.raw_ev_charging_stations.first).to have_key(:zip)
      expect(ns.raw_ev_charging_stations.first).to have_key(:distance)
      expect(ns.raw_ev_charging_stations.first).to have_key(:latitude)
      expect(ns.raw_ev_charging_stations.first).to have_key(:longitude)
    end
  end
end
