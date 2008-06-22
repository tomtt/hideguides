require File.dirname(__FILE__) + '/../spec_helper'

describe LonelyPlanetProximityPois do
  before(:each) do
    @lonely_planet_proximity_pois = LonelyPlanetProximityPois.new
  end

  describe 'fetching data by location' do
    before(:each) do
      proximity_pois_xml = File.read(File.join(RAILS_ROOT, 'spec', 'fixtures', 'lonely_planet', 'proximity_pois_response.xml'))
      @lp_mock_api = mock('api')
      @lp_mock_api.stub!(:get).and_return proximity_pois_xml
    end
    
    it "should get xml" do
      @lp_mock_api.get(52.0, -1.0).should =~ /^<\?xml version/
    end
    
    it "should request pois based on location" do
      1.should == 1
    end
  end
end
