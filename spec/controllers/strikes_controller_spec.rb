require 'spec_helper'

describe StrikesController do
  let(:strike){ Factory(:strike) }

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
      get :show, :id => strike.id
      assigns[:strike].should_not == nil
      response.should render_template('show')
    end
  end

  describe :destroy do
    it "deleted a strike" do
      login_as strike.creator
      delete :destroy, :id => strike.id
      lambda{
        strike.reload
      }.should raise_error
    end

    it "does not delete if im not the owner" do
      login_as Factory(:user)
      delete :destroy, :id => strike.id
      strike.reload
    end
  end

  describe :edit do
    it "does not edit if im not the owner" do
      login_as Factory(:user)
      get :edit, :id => strike.id
      response.should redirect_to(strike)
    end

    it "renders" do
      login_as strike.creator
      get :edit, :id => strike.id
      response.should render_template(:edit)
    end
  end

  describe :update do
    it "does not edit if im not the owner" do
      login_as Factory(:user)
      lambda{
        put :update, :id => strike.id, :strike => {:comment => 'xxx'}
      }.should_not change{strike.reload.comment}
    end

    it "updates a strike" do
      login_as strike.creator
      lambda{
        put :update, :id => strike.id, :strike => {:comment => 'xxx'}
      }.should change{strike.reload.comment}
      response.should redirect_to(strike)
    end

    it "fails to update a strike" do
      login_as strike.creator
      lambda{
        put :update, :id => strike.id, :strike => {:organisation => ''}
      }.should_not change{strike.reload.organisation}
      response.should render_template('edit')
    end
  end
end
