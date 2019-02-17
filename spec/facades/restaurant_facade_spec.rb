require 'rails_helper'

RSpec.describe RestaurantFacade do
  it 'exists' do
    new = RestaurantFacade.new("food", 39.7392, -104.9903)

    expect(new).to be_an_instance_of RestaurantFacade
  end
  it 'returns a collection of restaurants' do
    # VCR.use_cassette("yelp_restaurants") do
      new = RestaurantFacade.new("food", 39.7392, -104.9903)
      rests = new.restaurants
      expect(rests.count).to eq(25)
      expect(rests[0]).to be_an_instance_of Restaurant
    # end
  end
end
