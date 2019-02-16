class Museum
  attr_reader :name,
              :image_url,
              :is_closed,
              :url,
              :review_count,
              :rating,
              :coordinates,
              :location,
              :display_phone,
              :distance
  
  def initialize(attributes)
    @name = attributes[:name]
    @image_url = attributes[:image_url]
    @is_closed = attributes[:is_closed]
    @url = attributes[:url]
    @review_count = attributes[:review_count]
    @rating = attributes[:rating]
    @coordinates = attributes[:coordinates]
    @location = attributes[:location]
    @display_phone = attributes[:display_phone]
    @distance = attributes[:distance]
  end
end
