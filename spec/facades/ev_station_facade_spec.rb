require 'rails_helper'

describe EvStationFacade do
  it 'exists' do
    lat = "39.7392"
    lon = "-104.9903"
    evsf = EvStationFacade.new(lat, lon)

    expect(evsf).to be_a(EvStationFacade)
  end
  it 'all_ev_stations', :vcr do
    lat = "39.7392"
    lon = "-104.9903"
    evsf = EvStationFacade.new(lat, lon)

    expect(evsf.all_ev_stations.count).to eq(20)
    expect(evsf.all_ev_stations.first).to be_a(EvStation)
  end
  it 'public_ev_stations', :vcr do
    lat = "39.7392"
    lon = "-104.9903"
    evsf = EvStationFacade.new(lat, lon)

    expect(evsf.public_ev_stations.count).to eq(20)
    expect(evsf.public_ev_stations.first).to be_a(EvStation)
  end
end
