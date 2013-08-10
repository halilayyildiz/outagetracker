class OutagesController < ApplicationController

  def new
    @outages = Outage.new
  end

  #def create
  #  render text: params[:post].inspect
  #end

  def index
    @outages = Outage.all
  end

  def create
    @outages = Outage.new(params.require(:outage).permit(:outage_id, :description, :location, :start_date, :end_date,
                                                        :address, :affected_customers))

    @outages.save
    redirect_to @outages
  end

  def show
    @outages = Outage.find(params[:id])
  end

end
