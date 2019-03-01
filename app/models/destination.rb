class Destination < ApplicationRecord
  include ApplicationHelper
  validates_presence_of :name, :location

  has_many :user_destinations
  has_many :users, through: :user_destinations

  def self.add_from_internal_request(current_user, request)
    current_user.destinations << Destination.find_or_create_by(parse_request(request))
  end

  private

  def self.parse_request(request)
    picked_location_html = JSON.parse(request, symbolize_names: true)[:popup_html]
    name_address_html = picked_location_html.split("<p>")[1]
    name_location = ApplicationHelper.strip_tags(name_address_html).split("Address: ")
    { name: name_location[0], location: name_location[1] }
  end
end
