class Api::UsersController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def fetch_user
    @user = User.find_by_id(params[:id])
  end


  def index
    @user = User.all
    respond_to do |format|
      format.json { render json: @user }
      format.xml { render xml: @user }
    end
  end

  def create
    # params.permit(:push_id, :installation_id, :format)
    # Rails.logger.debug params.inspect

    @user = User.new(installation_id:params[:installation_id], push_id:params[:push_id])
    respond_to do |format|
      if @user.save
        format.json { render json: @user, status: :created }
        format.xml { render xml: @user, status: :created }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
        format.xml { render xml: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  def new

  end

  def edit

  end

  def show
    respond_to do |format|
      format.json { render json: @user }
      format.xml { render xml: @user }
    end
  end

  def update
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.json { head :no_content, status: :ok }
        format.xml { head :no_content, status: :ok }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
        format.xml { render xml: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @user.destroy
        format.json { head :no_content, status: :ok }
        format.xml { head :no_content, status: :ok }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
        format.xml { render xml: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
end
