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

  describe :show do
    it "renders" do
      get :show, :id => Factory(:strike).id
      assigns[:strike].should_not == nil
      response.should render_template('show')
    end
  end

  describe :destroy do
    it "deleted a strike" do
      strike = Factory(:strike)
      login_as strike.creator
      delete :destroy, :id => strike.id
      lambda{
        strike.reload
      }.should raise_error
    end

    it "does not delete if im not the owner" do
      strike = Factory(:strike)
      login_as Factory(:user)
      delete :destroy, :id => strike.id
      strike.reload
    end
  end
end
