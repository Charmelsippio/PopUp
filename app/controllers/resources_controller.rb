class ResourcesController < ApplicationController
  

  def index
    @podcast = Podcast.find(params[:podcast_id])
    @articles = [
      Resource.nokogiri_data(1),
      Resource.nokogiri_data(3),
      Resource.nokogiri_data(8),
      Resource.nokogiri_data(5),
      Resource.nokogiri_data(6)
    ]
  end

  def new
    @podcast = Podcast.find(params[:podcast_id])
    @resource = Resource.new
    @options_for_select = Resource.all.map { |resource| [resource.publication, resource.id] }
  end

  def create
    @podcast = Podcast.find(params[:podcast_id])
    @resource = Resource.new(resource_params)
      if @resource.save
        # redirect_to "/podcasts/#{@podcast.id}/resources/#{@resource.id}"
        redirect_to podcast_resource_path(@podcast, @resource)
      else
        redirect_to new_podcast_resource_path(@podcast)
      end
  end

  def edit
    @resource = Resource.find(params[:id])
  end

  def show
    @podcast = Podcast.find(params[:podcast_id])
    @articles = [
      Resource.nokogiri_data(1),
      Resource.nokogiri_data(3),
      Resource.nokogiri_data(8),
      Resource.nokogiri_data(5),
      Resource.nokogiri_data(6)
    ]
  end

  def update
    @resource = Resource.find(params[:id])
      if @resource.update(resource_params.permit(:title, :link, :document))
        redirect_to @resource
        # redirect_to podcast_resource_path(@resource)
      else
        render 'edit'
      end
  end

  def destroy
    @podcast = Podcast.find(params[:podcast_id])
    @resource = Resource.find(params[:id]) 
    @resource.destroy

    redirect_to podcast_path(current_admin)
  end

  private
    def resource_params
      params.require(:resource).permit(:title, :link, :document, :time, :podcast_id)
    end

end
