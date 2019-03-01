class EvSearchController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :require_user

  def create
    Destination.add_from_internal_request(current_user, request.body.read)
    Cache.write(ev_facade: EvStationFacade.new(ev_facade_params))
    redirect_to ev_map_url, status: 302
  end

  private

  def ev_facade_params
    params.permit(:coordinates, :popup_html)
  end
end
