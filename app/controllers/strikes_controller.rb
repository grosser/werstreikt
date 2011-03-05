class StrikesController < ApplicationController
  before_filter :login_required, :only => [:new, :create]
end
