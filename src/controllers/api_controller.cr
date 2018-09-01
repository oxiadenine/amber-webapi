class ApiController < ApplicationController
  def index
    respond_with do
      text I18n.translate "welcome_amber_webapi"
    end
  end
end
