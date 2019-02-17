require 'rails_helper'

describe YelpService do
  it 'exists' do
    yelp = YelpService.new("food", 39.7392, -104.9903)

    expect(yelp).to be_an_instance_of YelpService
  end
  it 'returns a collection of restaurants' do
    # VCR.use_cassette("yelp_restaurants") do
      rests = YelpService.get_restaurants("food", 39.7392, -104.9903)

      expect(rests.first).to have_key("coordinates")
      expect(rests.first["coordinates"]).to have_key("latitude")
      expect(rests.first["coordinates"]).to have_key("longitude")
      expect(rests.first).to have_key("name")
      expect(rests.first).to have_key("location")
      expect(rests.first["location"]).to have_key("address1")
      expect(rests.first["location"]).to have_key("city")
      expect(rests.first["location"]).to have_key("state")
      expect(rests.first["location"]).to have_key("zip_code")
      expect(rests.first).to have_key("phone")
      expect(rests.first).to have_key("distance")
    # end
  end
end
