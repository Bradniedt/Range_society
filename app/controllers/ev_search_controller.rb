class EvSearchController < ApplicationController
  protect_from_forgery with: :null_session
  def create
    JSON.parse(request.body.read, symbolize_names: true)
  end
end
