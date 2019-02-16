require 'rails_helper'

describe NrelService do
  it 'exists', :vcr do
    lat = "39.7392"
    lon = "-104.9903"
    ns = NrelService.new(lat, lon)

    expect(ns).to be_a(NrelService)
  end
  it 'gets 25 or less ev charging stations', :vcr do
    lat = "39.7392"
    lon = "-104.9903"
    ns = NrelService.new(lat, lon)
    count = 25

    expect(ns.ev_charging_stations.count).to eq(count)
    expect(ns.ev_charging_stations.first).to have_key(:access_days_time)
    expect(ns.ev_charging_stations.first).to have_key(:station_name)
    expect(ns.ev_charging_stations.first).to have_key(:street_address)
    expect(ns.ev_charging_stations.first).to have_key(:city)
    expect(ns.ev_charging_stations.first).to have_key(:state)
    expect(ns.ev_charging_stations.first).to have_key(:zip)
    expect(ns.ev_charging_stations.first).to have_key(:distance)
    expect(ns.ev_charging_stations.first).to have_key(:latitude)
    expect(ns.ev_charging_stations.first).to have_key(:longitude)
  end
end
