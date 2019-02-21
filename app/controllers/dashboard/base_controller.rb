class Dashboard::BaseController < ApplicationController
  before_action :require_user
  Draper.configure do |config|
    config.default_controller = BaseController
  end
end
