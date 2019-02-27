class MapController < ApplicationController
  def show
    # NEW FACADE FOR MAP VIEW NEEDED
    @lat = session[:search]["lat"]
    @lon = session[:search]["lon"]
    @service = YelpService.new(@lat, @lon)
    activities = session[:search]["activity"]

    if first_or_changed_search?(activities, @lat, @lon)
      @businesses = make_api_call(@service, :businesses_search, activities)
      Cache.save_to_cache({
        activities: activities,
        lat: @lat,
        lon: @lon,
        businesses: @businesses},
        CACHE_EXPIRATION )
    else
      @businesses = Cache.retrieve('businesses')
    end
  end

  private

  def first_or_changed_search?(activities, lat, lon)
    Cache.first_search?('activities') || Cache.changed_business_search?(activities, lat, lon)
  end
end
