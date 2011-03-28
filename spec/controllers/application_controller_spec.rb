require 'spec_helper'

describe HomeController do
  describe :current_user do
    let(:user){ Factory(:user) }

    it "finds it from session" do
      session[:user_id] = user.id
      get :index
      controller.send(:current_user).should == user
    end

    it "finds it from remember_token" do
      request.cookies[:remember_token] = user.remember_token
      get :index
      controller.send(:current_user).should == user
    end

    it "sets user_id in session" do
      controller.send(:current_user=, user)
      session[:user_id].should == user.id
    end
  end
end
