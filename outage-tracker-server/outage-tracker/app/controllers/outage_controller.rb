class OutageController < ApplicationController

  def new
    @outage = Outage.new
  end

  #def create
  #  render text: params[:post].inspect
  #end

  def index
    @outage = Outage.all
  end

  def create
    @outage = Outage.new(params.require(:outage).permit(:outage_id, :description, :location, :start_date, :end_date,
                                                        :address, :affected_customer))

    @outage.save
    redirect_to @outage
  end

  def show
    @outage = Outage.find(params[:id])
  end

end
