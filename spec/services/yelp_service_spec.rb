require 'rails_helper'

describe YelpService do
  it 'exists' do
    yelp = YelpService.new("food", 39.7392, -104.9903)

    expect(yelp).to be_an_instance_of YelpService
  end
  it 'returns a collection of restaurants' do
    # VCR.use_cassette("yelp_restaurants") do
      rests = YelpService.get_restaurants("food", 39.7392, -104.9903)

      expect(rests.count).to eq(25)
      expect(rests[0]).to be_an_instance_of Restaurant
    # end
  end
end
