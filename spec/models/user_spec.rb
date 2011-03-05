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
end
