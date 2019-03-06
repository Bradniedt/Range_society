class YelpFacade
  attr_reader :lat, :lon, :activities
  def initialize(lat, lon, activities=nil)
    @lat = lat
    @lon = lon
    @activities = activities
  end

  def businesses(activities=nil)
    businesses = Cache.get_businesses(@activities, @lat, @lon)
    unless businesses
      businesses = get_businesses
      Cache.write(activities: @activities, lat: @lat, lon: @lon, businesses: businesses)
    end
    businesses
  end

  private

  def service
    YelpService.new(@lat, @lon)
  end

  def create_places(places, category)
    places.map do |raw_place|
      Place.new(raw_place, category)
    end
  end

  def get_businesses
    limit = 25 / @activities.length

    @activities.map do |category|
      create_places(service.businesses_search(category, nil, limit), category)
    end.flatten
  end
end
