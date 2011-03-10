class StrikesController < ApplicationController
  before_filter :find_strike, :only => [:show, :edit, :update, :destroy]
  before_filter :login_required, :only => [:new, :create, :destroy, :update, :edit]
  before_filter :owner_required, :only => [:edit, :update, :destroy]

  def show
    @strike = Strike.find(params[:id])
  end

  def index
    @strikes = Strike.in_next_days(31).to_a
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

  def edit
    @strike = Strike.find(params[:id])
  end

  def update
    @strike = Strike.find(params[:id])
    if @strike.update_attributes(params[:strike])
      redirect_to @strike, :notice => 'Gespeichert!'
    else
      render 'edit'
    end
  end

  def destroy
    strike = Strike.find(params[:id])
    strike.destroy if current_user.is_owner?(strike)
    redirect_to root_path
  end

  private

  def find_strike
    @strike = Strike.find(params[:id])
  end

  def owner_required
    redirect_to @strike unless current_user.is_owner?(@strike)
  end
end
