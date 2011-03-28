require 'spec_helper'

describe User do
  describe 'gender' do
    it "defaults to unknown" do
      User.new().gender.should == :unknown
    end

    it "parses gender_id" do
      User.new(:gender_id => 1).gender.should == :male
    end

    it "can set" do
      User.new(:gender => :male).gender.should == :male
    end

    it "can set with string" do
      User.new(:gender => 'male').gender.should == :male
    end

    it "is unknown for the rest" do
      User.new(:gender => 'asdasd').gender.should == :unknown
    end
  end

  describe :name do
    it "adds first and last" do
      User.new(:first_name => 'F', :last_name => 'L').name.should == "F L"
    end
  end

  describe :remember_token do
    it "is generated when none exists" do
      user = Factory.build(:user, :remember_token => nil)
      user.save!
      user.remember_token.size.should == 40
    end

    it "is different each time" do
      user = Factory.build(:user, :remember_token => nil)
      user2 = Factory.build(:user, :remember_token => nil)
      user.save!
      user2.save!
      user.remember_token.should_not == user2.remember_token
    end

    it "does not change" do
      user = Factory.build(:user, :remember_token => nil)
      user.save!
      lambda{
        user.save
      }.should_not change{user.reload.remember_token}
    end
  end
end
