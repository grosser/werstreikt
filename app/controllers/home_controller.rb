class HomeController < ApplicationController
  def index
    @dates = (0..30).to_a.map{|i| Date.today + i }
    @strikes = Strike.where(:start_on => @dates.first..@dates.last).to_a
    @strikes = @strikes.group_by(&:organisation).sort_by{|_,strikes| strikes.map(&:start_on).min }
  end
end
