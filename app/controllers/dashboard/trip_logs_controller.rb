class Dashboard::TripLogsController < Dashboard::BaseController

  def new
    @trip_log = TripLog.new
  end

end
