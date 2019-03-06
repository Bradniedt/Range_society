require 'rails_helper'

describe EvStationFacade do
  it 'exists' do
    attributes = {coordinates: "39.7392 -104.9903"}
    evsf = EvStationFacade.new(attributes)

    expect(evsf).to be_a(EvStationFacade)
  end
  it 'public_ev_stations', :vcr do
    attributes = {coordinates: "39.7392 -104.9903"}
    evsf = EvStationFacade.new(attributes)

    expect(evsf.stations.count).to eq(20)
    expect(evsf.stations.first).to be_a(EvStation)
  end
end
