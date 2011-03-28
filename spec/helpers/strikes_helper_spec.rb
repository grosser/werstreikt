require 'spec_helper'

describe StrikesHelper do
  describe :formatted_strike_source do
    it "is empty for empty source" do
      formatted_strike_source(' ').should == ''
    end

    it "is name for simple name" do
      formatted_strike_source('ARD Tagesthemen').should == 'Quelle: ARD Tagesthemen'
    end

    it "is link to source for url" do
      formatted_strike_source('http://xxx.de/foo').should == 'Quelle: <a href="http://xxx.de/foo">xxx.de</a>'
    end

    it "is link to source for url with www" do
      formatted_strike_source('http://www.xxx.de/foo').should == 'Quelle: <a href="http://www.xxx.de/foo">xxx.de</a>'
    end
  end
end
