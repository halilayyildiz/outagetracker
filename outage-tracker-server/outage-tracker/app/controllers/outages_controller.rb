class OutagesController < ApplicationController

  def new
  end

  #def create
  #  render text: params[:post].inspect
  #end

  def create
    @outage = Outage.new(outage_params)

    @outage.save
    redirect_to @outage
  end

  def show
    @outage = Outage.find(params[:id])
  end

  private
  def outage_params
    params.require(:outage).permit(:title, :text)
  end

end
