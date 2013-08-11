class UsersController < ApplicationController

  def new
    @users = User.new
  end

  #def create
  #  render text: params[:post].inspect
  #end

  def index
    @users = User.all
  end

  def create
    @users = User.new(params.require(:user).permit(:installation_id, :push_id))

    @users.save
    redirect_to @users
  end

  def show
    @users = User.find(params[:id])
  end

end
