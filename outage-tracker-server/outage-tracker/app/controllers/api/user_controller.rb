class Api::UserController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def register
    @user = User.new(installation_id: params[:inst_id], push_id: params[:push_id])
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

end
