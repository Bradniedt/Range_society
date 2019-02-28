class Place
  attr_reader :name,
              :image_url,
              :is_closed,
              :url,
              :review_count,
              :rating,
              :coordinates,
              :location,
              :display_phone,
              :distance,
              :category

  def initialize(attributes, category)
    @name =  clean_for_popup(attributes[:name])
    @image_url = clean_for_popup(attributes[:image_url])
    @is_closed = clean_for_popup(attributes[:is_closed])
    @url = clean_for_popup(attributes[:url])
    @review_count = clean_for_popup(attributes[:review_count])
    @rating = clean_for_popup(attributes[:rating])
    @coordinates = clean_for_popup(attributes[:coordinates])
    @location = clean_for_popup(attributes[:location])
    @display_phone = clean_for_popup(attributes[:display_phone])
    @distance = clean_for_popup(attributes[:distance])
    @category = clean_for_popup(category)
  end

  def display_address
    location[:display_address].join(" ")
  end

  def popup_html
    "<div class='popup'><p><b>#{name}</b></p><b>Address:</b> #{display_address}</p><p><a href='#' onclick='return chooseLocal(event);' data-coords='#{coordinates[:latitude]} #{coordinates[:longitude]}'>Choose this Location</a><a href='#{url}'>View on Yelp</a></p></div>"
  end
end
