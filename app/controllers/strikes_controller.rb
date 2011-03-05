class StrikesController < ApplicationController
  before_filter :login_required, :only => [:new, :create]

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
end
