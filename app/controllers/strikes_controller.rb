class StrikesController < ApplicationController
  before_filter :login_required, :only => [:new, :create, :destroy]

  def show
    @strike = Strike.find(params[:id])
  end

  def new
    @strike = Strike.new
  end

  def create
    @strike = Strike.new(params[:strike])
    @strike.creator = current_user
    if @strike.save
      redirect_to root_url, :notice => 'Streik erstellt!'
    else
      flash[:error] = 'Streik konnte nicht erstellt werden!'
      render 'new'
    end
  end

  def destroy
    strike = Strike.find(params[:id])
    strike.destroy if current_user.is_owner?(strike)
    redirect_to root_path
  end
end
