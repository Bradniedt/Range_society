class Destination < ApplicationRecord
  include ApplicationHelper
  validates_presence_of :name, :location

  has_many :user_destinations
  has_many :users, through: :user_destinations

  def self.add_destination(current_user, search_params)
    current_user.destinations << Destination.find_or_create_by(parse_params(search_params))
  end

  private

  def self.parse_params(params)
    name_address_html = params[:popup_html].split("<p>")[1]
    name_location = ApplicationHelper.strip_tags(name_address_html).split("Address: ")
    { name: name_location[0], location: name_location[1] }
  end
end
