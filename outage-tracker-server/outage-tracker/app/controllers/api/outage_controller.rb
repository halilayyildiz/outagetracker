class Api::OutageController < ApplicationController

  def fetch_outage
    @outage = Outage.find_by_id(params[:id])
  end


  def index
    @outage = Outage.all
    respond_to do |format|
      format.json { render json: @outage }
      format.xml { render xml: @outage }
    end
  end


  def create
    @outage = Outage.new(params[:Outage])
    respond_to do |format|
      if @outage.save
        format.json { render json: @outage, status: :created }
        format.xml { render xml: @outage, status: :created }
      else
        format.json { render json: @outage.errors, status: :unprocessable_entity }
        format.xml { render xml: @outage.errors, status: :unprocessable_entity }
      end
    end
  end


  def new

  end

  def edit

  end

  def show
    respond_to do |format|
      format.json { render json: @outage }
      format.xml { render xml: @outage }
    end
  end

  def update
    respond_to do |format|
      if @outage.update_attributes(params[:Outage])
        format.json { head :no_content, status: :ok }
        format.xml { head :no_content, status: :ok }
      else
        format.json { render json: @outage.errors, status: :unprocessable_entity }
        format.xml { render xml: @outage.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @outage.destroy
        format.json { head :no_content, status: :ok }
        format.xml { head :no_content, status: :ok }
      else
        format.json { render json: @outage.errors, status: :unprocessable_entity }
        format.xml { render xml: @outage.errors, status: :unprocessable_entity }
      end
    end
  end
end