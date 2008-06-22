require File.dirname(__FILE__) + '/../spec_helper'

describe FireeagleToken do
  before(:each) do
    @fireeagle_token = FireeagleToken.new
  end

  it "should be valid" do
    @fireeagle_token.should be_valid
  end
end
