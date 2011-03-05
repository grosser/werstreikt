require 'spec_helper'

describe StrikesController do
  describe :new do
    it "renders" do
      get :new
    end
  end

  describe :create do
    before do
      login_as @user = Factory(:user)
    end

    it "creates a new strike" do
      lambda{
        post :create, :strike => {:start_on => '2010-10-01', :end_on => '2010-10-02', :organisation => 'GDL'}
      }.should change{Strike.count}.by(+1)
      Strike.last.creator.should == @user
      response.should redirect_to root_url
    end

    it "renders if it fails to create" do
      post :create, :strike => {}
      response.should render_template('new')
    end
  end
end
