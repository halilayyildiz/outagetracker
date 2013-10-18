class Api::OutageController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def list
    @outages = Outage.all
    render json: @outages
  end

  def tcall

    user_inst_id = params[:inst_id]
    puts 'INFO : transmitting new trouble call request to OMS server'




    render json: 'accepted new tcall from user ->' + user_inst_id, status: :unprocessable_entity
  end


end