class EvSearchController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :require_user

  def create
    Destination.add_destination(current_user, search_params)
    Cache.write({ev_facade: EvStationFacade.new(search_params)}, 5.minutes)
    redirect_to ev_map_url, status: 302
  end

  private

  def search_params
    params.require(:ev_search).permit(:coordinates, :popup_html)
  end
end
