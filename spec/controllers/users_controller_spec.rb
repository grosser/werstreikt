require 'spec_helper'

describe UsersController do
  describe :login_with_facebook do
    before do
      User.delete_all
    end

    def stub_facebook_call(options={})
      data = {
        'first_name' => 'FN',
        'last_name' => 'LN',
        'id' => '100000000000000234',
        'gender' => 'male',
        'email' => 'asdad@saads.com',
        'something_else' => 'xxx'
      }.merge(options)
      controller.should_receive(:load_facebook_data).with('TOKEN').and_return data
    end

    it "can create" do
      stub_facebook_call
      lambda{
        post :login_with_facebook, :access_token => 'TOKEN'
      }.should change{User.count}.by(+1)
    end

    it "logs in a newly created user" do
      stub_facebook_call
      post :login_with_facebook, :access_token => 'TOKEN'
      session[:user_id].should_not == nil
    end

    it "logs in an existing user" do
      user = Factory(:user)
      stub_facebook_call('id' => user.fb_id)
      post :login_with_facebook, :access_token => 'TOKEN'
      session[:user_id].should == user.id
    end

    it "redirects to action before login" do
      session[:redirect_after_login] = {:controller => 'users', :action => 'new'}
      user = Factory(:user)
      stub_facebook_call('id' => user.fb_id)
      post :login_with_facebook, :access_token => 'TOKEN'
      response.should redirect_to('/users/new')
    end
  end

  describe :logout do
    it "terminates the session" do
      user = Factory(:user)
      session[:user_id] = user.id
      get :logout
      session[:user_id].should == nil
      response.should redirect_to('/')
    end
  end
end
