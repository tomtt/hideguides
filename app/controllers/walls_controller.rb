class WallsController < ApplicationController
  def show
    @poi = PointOfInterest.find(params['poi_id'])
    @wall = Wall.find_by_point_of_interest_id(params['poi_id'])
    if !@wall
      @wall = Wall.create!(:point_of_interest => @poi)
    end
    @postings = @wall.postings
  end
end
