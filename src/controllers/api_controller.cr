class ApiController < ApplicationController
  def index
    respond_with do
      text "Welcome to Amber Web API"
    end
  end
end
