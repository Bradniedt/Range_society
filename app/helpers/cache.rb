module Cache
  def self.save_to_cache(key_and_values, expiration)
    key_and_values.each do |k,v|
      Rails.cache.delete k
      Rails.cache.write(k, v, expires_in: expiration)
    end
  end
  def self.retrieve(key)
    Rails.cache.read(key)
  end
  def self.changed_business_search?(activities, lat, lon)
    activity_search = activities == Rails.cache.read('activities')
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
