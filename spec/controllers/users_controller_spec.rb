require 'spec_helper'

describe UsersController do
  describe :create_get do
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
        post :create, :access_token => 'TOKEN'
      }.should change{User.count}.by(+1)
    end

    it "logs in a newly created user" do
      stub_facebook_call
      post :create, :access_token => 'TOKEN'
      session[:user_id].should_not == nil
    end

    it "logs in an existing user" do
      user = Factory(:user)
      stub_facebook_call('id' => user.fb_id)
      post :create, :access_token => 'TOKEN'
      session[:user_id].should == user.id
    end
  end
end
