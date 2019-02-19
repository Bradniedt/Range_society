class MapController < ApplicationController
  def show
    @lat = session[:search]["lat"]
    @lon = session[:search]["lon"]
    @service = YelpService.new(@lat, @lon)
    activities = session[:search]["activity"]

    if first_search?
      @businesses = @service.businesses_search(activities)
      binding.pry
      save_search(activities, @lat, @lon, @businesses)
    else
      if changed_search?(activities, @lat, @lon)
        binding.pry
        @businesses = @service.businesses_search(activities)
        save_search(activities, @lat, @lon, @businesses)
      else
        binding.pry
        @businesses = cache.read('businesses')
      end
    end

  end
end
