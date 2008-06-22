class WallsController < ApplicationController
  def show
    @poi = Poi.find(params['poi_id'])
    @wall = Wall.find_by_poi_id(params['poi_id'])
    if !@wall
      @wall = Wall.create!(:poi => @poi)
    end
    @postings = @wall.postings
  end
end
