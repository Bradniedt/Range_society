require 'rails_helper'

describe Museum, type: :model do
  before :each do
    VCR.use_cassette("https://api.yelp.com/v3/businesses/search?categories=museums&latitude=39.7392&longitude=-104.9903") do
      conn = Faraday.new("https://api.yelp.com/v3/businesses/search") do |f|
        f.adapter Faraday.default_adapter
        f.headers["Authorization"] = ENV['YELP_KEY']
      end
      response = conn.get do |req|
        req.params['latitude'] = '39.7392'
        req.params['longitude'] = '-104.9903'
        req.params['categories'] = 'museums'
      end
      @museums = JSON.parse(response.body, symbolize_names: true)[:businesses]
    end
  end
  it 'exists and has attributes' do
    museum_data = @museums.first
    museum = Museum.new(museum_data)

    expect(museum.name).to eq(museum_data[:name])
    expect(museum.image_url).to eq(museum_data[:image_url])
    expect(museum.is_closed).to eq(museum_data[:is_closed])
    expect(museum.url).to eq(museum_data[:url])
    expect(museum.review_count).to eq(museum_data[:review_count])
    expect(museum.rating).to eq(museum_data[:rating])
    expect(museum.coordinates).to eq(museum_data[:coordinates])
    expect(museum.location).to eq(museum_data[:location])
    expect(museum.display_phone).to eq(museum_data[:display_phone])
    expect(museum.distance).to eq(museum_data[:distance])
  end
end
