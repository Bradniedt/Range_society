require 'rails_helper'

RSpec.describe 'Restaurant', type: :model do
  before :each do
    @data = { "coordinates" => { "latitude" => 20, "longitude" => 20},
             "name" => "bob's burgers",
             "location" => {
                "address1" => "a street",
                "city" => "a city",
                "state" => "a state",
                "zip_code" => "a zip"
               },
             "phone" => "303-303-3030",
             "distance" => 1234 }
    @new = Restaurant.new(@data)
  end
  it 'exists' do
    expect(@new).to be_an_instance_of Restaurant
  end
  it 'has attributes' do
    expect(@new.latitude).to eq(@data["coordinates"]["latitude"])
    expect(@new.longitude).to eq(@data["coordinates"]["longitude"])
    expect(@new.name).to eq(@data["name"])
    expect(@new.street_address).to eq(@data["location"]["address1"])
    expect(@new.city).to eq(@data["location"]["city"])
    expect(@new.state).to eq(@data["location"]["state"])
    expect(@new.zip_code).to eq(@data["location"]["zip_code"])
    expect(@new.phone).to eq(@data["phone"])
    expect(@new.distance).to eq(@data["distance])
  end
end
