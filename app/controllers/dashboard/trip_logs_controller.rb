class Dashboard::TripLogsController < BaseController

  def new
    @trip_log = TripLog.new
  end

  def create
    trip_log = current_user.trip_logs.create(trip_params)
    if trip_log.save
      redirect_to dashboard_trip_logs_path
      flash[:success] = "Your trip has been saved!"
    else
      render :new
    end
  end

  def index
    @trip_logs = TripLog.all
  end


private
  def trip_params
    params.require(:trip_log).permit(:title, :miles, :description)
  end
end
