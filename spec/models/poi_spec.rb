require File.dirname(__FILE__) + '/../spec_helper'

describe Poi do
  before(:each) do
    @poi = Poi.new
  end

  it "should be valid" do
    @poi.should be_valid
  end
end
