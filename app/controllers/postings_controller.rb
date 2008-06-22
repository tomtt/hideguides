class PostingsController < ApplicationController
  # before_filter :load_enclosing_stuff
  resources_controller_for :postings

  def create
    super
  end
  
  def create
    load_enclosing_stuff
    @posting = @wall.postings.build(params[:posting])
    @posting.user_id = current_user
    if @posting.save
      flash[:notice] = 'Posting was successfully created.'
      redirect_to poi_wall_postings_path(@poi)
    else
      render :action => "new"
    end
  end

  protected
  
  def find_resources
    load_enclosing_stuff
    @wall.postings
  end
  
  def new_resource
    load_enclosing_stuff
    @wall.postings.build(params[:posting])
  end
  
  def load_enclosing_stuff
    @poi = Poi.find(params[:poi_id])
    @wall = Wall.find_or_create_by_poi_id(@poi.id)
    # @wall = Wall.find_by_poi_id(@poi)
    # unless @wall
    #   @wall = Wall.create_by_poi_id(@poi_id)
    # end
  end
end
