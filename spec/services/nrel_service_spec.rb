require 'rails_helper'

describe NrelService do
  it 'exists', :vcr do
    ns = NrelService.new

    expect(ns).to be_a(NrelService)
  end
end
