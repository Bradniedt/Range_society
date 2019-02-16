require 'rails_helper'

describe EvStation do
  it 'exists' do
    attributes = {}
    evs = EvStation.new(attributes)

    expect(evs).to be_a(EvStation)
  end
  it 'is initialized with attributes' do
    attributes = {
      access_days_time: "24/7",
      station_name: "Bobs",
      street_address: "55 N 5th",
      city: "Denver",
      state: "CO",
      zip: 80211,
      distance: "0.004",
      latitude: "39.7392",
      longitude: "-104.9903"
    }
    evs = EvStation.new(attributes)

    expect(evs.name).to eq(attributes[:station_name])
    expect(evs.distance).to eq(attributes[:distance])
    expect(evs.lat).to eq(attributes[:latitude])
    expect(evs.lon).to eq(attributes[:longitude])
  end
end
