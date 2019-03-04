module Cache
  CACHE_EXPIRATION = 30.days

  def self.write(key_and_values, expiration=nil)
    key_and_values.each do |k,v|
      Rails.cache.delete k
      Rails.cache.write(k, v, expires_in: expiration || CACHE_EXPIRATION)
    end
  end

  def self.get_stations(lat, lon)
    return nil if changed_station_search?(lat, lon)
    retrieve(:ev_stations)
  end

  def self.get_businesses(activities, lat, lon)
    return nil if changed_business_search?(activities, lat, lon)
    retrieve(:activities)
  end

  def self.retrieve(key, options=nil)
    value = Rails.cache.read(key)
    Rails.cache.delete key if options && options[:delete]
    value
  end

  private

  def self.changed_business_search?(activities, lat, lon)
    activity_search = activities == Rails.cache.read(:activities)
    lat_search = (Rails.cache.read('lat').to_f - lat.to_f).abs > 0.0043
    lon_search = (Rails.cache.read('lon').to_f - lon.to_f).abs > 0.0043

    !activity_search || (lat_search || lon_search)
  end
  def self.changed_station_search?(lat, lon)
    lat_search = (Rails.cache.read('ev_lat').to_f - lat.to_f).abs > 0.0172
    lon_search = (Rails.cache.read('ev_lon').to_f - lon.to_f).abs > 0.0172

    lat_search || lon_search
  end
  def self.first_search?(key)
    !Rails.cache.read(key)
  end
end
