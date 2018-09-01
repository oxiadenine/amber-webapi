class ApiController < ApplicationController
  def index
    I18n.translate "welcome_amber_webapi"
  end
end
