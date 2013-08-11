class Api::OutageController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def index
    @outages = Outage.all
    render json: @outages
  end

end