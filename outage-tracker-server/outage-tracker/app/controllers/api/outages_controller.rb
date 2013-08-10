class Api::OutagesController < ApplicationController

  def fetch_outage
    @outages = Outage.find_by_id(params[:id])
  end


  def index
    @outages = Outage.all
    respond_to do |format|
      format.json { render json: @outages }
      format.xml { render xml: @outages }
    end
  end


  def create
    @outages = Outage.new(params[:Outage])
    respond_to do |format|
      if @outages.save
        format.json { render json: @outages, status: :created }
        format.xml { render xml: @outages, status: :created }
      else
        format.json { render json: @outages.errors, status: :unprocessable_entity }
        format.xml { render xml: @outages.errors, status: :unprocessable_entity }
      end
    end
  end


  def new

  end

  def edit

  end

  def show
    respond_to do |format|
      format.json { render json: @outages }
      format.xml { render xml: @outages }
    end
  end

  def update
    respond_to do |format|
      if @outages.update_attributes(params[:Outage])
        format.json { head :no_content, status: :ok }
        format.xml { head :no_content, status: :ok }
      else
        format.json { render json: @outages.errors, status: :unprocessable_entity }
        format.xml { render xml: @outages.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @outages.destroy
        format.json { head :no_content, status: :ok }
        format.xml { head :no_content, status: :ok }
      else
        format.json { render json: @outages.errors, status: :unprocessable_entity }
        format.xml { render xml: @outages.errors, status: :unprocessable_entity }
      end
    end
  end
end