require 'rails_helper'

describe Place, type: :model do
  it 'exists and has attributes', :vcr do
    @businesses = YelpService.new(39.7392, -104.9903).send(:get_businesses, "museums")
    place_data = @businesses.first
    place = Place.new(place_data)

    expect(place.name).to eq(place_data[:name])
    expect(place.image_url).to eq(place_data[:image_url])
    expect(place.is_closed).to eq(place_data[:is_closed])
    expect(place.url).to eq(place_data[:url])
    expect(place.review_count).to eq(place_data[:review_count])
    expect(place.rating).to eq(place_data[:rating])
    expect(place.coordinates).to eq(place_data[:coordinates])
    expect(place.location).to eq(place_data[:location])
    expect(place.display_phone).to eq(place_data[:display_phone])
    expect(place.distance).to eq(place_data[:distance])
  end
end
