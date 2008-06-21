require File.dirname(__FILE__) + '/../spec_helper'

describe PointOfInterest do
  before(:each) do
    @point_of_interest = PointOfInterest.new
  end

  it "should be valid" do
    @point_of_interest.should be_valid
  end
end
