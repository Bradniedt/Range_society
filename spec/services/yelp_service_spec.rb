require 'rails_helper'

describe YelpService do
  it 'exists' do
    yelp = YelpService.new

    expect(yelp).to be_an_instance_of YelpService
  end
  it 'returns a collection of restaurants' do
    rests = YelpService.get_restaurants

    expect(rests.count).to eq(25)
    expect(rests[0]).to be_an_instance_of Restaurant
  end 
end
