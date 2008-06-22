class PoisController < ApplicationController
  def index
    @pois = LonelyPlanetProximityPois.fetch_for_position(51.593986,-0.132126)
  end
end
