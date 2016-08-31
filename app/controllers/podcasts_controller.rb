class PodcastsController < ApplicationController

  before_action :require_admin

  def index
    @podcasts = Podcast.where(:admin_id => current_admin)
    @podcast = Podcast.new
    # @podcasts = Podcasts.all
  end

  def show
    @podcasts = Podcast.where(:admin_id => current_admin)
    @podcast = Podcast.find(params[:id])
  end

  def new
    @podcast = Podcast.new
  end

  def create
    @podcast = Podcast.new(podcast_params)

    if @podcast.save
      redirect_to podcasts_path
    else
      render 'new' 
    end
  end

  def edit
    @podcast = Podcast.find(params[:id])
  end

  def update
    @podcast = Podcast.find(params[:id])
      if @podcast.update(podcast_params.permit(:title, :audio, :length))
        redirect_to podcasts_path  
      else
        render 'edit'
      end
  end

  def destroy
    @podcast = Podcast.find(params[:id])
    @podcast.destroy

    redirect_to podcasts_path
  end

  private
    def require_admin
      if current_admin
        true
      else
        false
      end
    end

    def podcast_params
      params.require(:podcast).permit(:title, :audio, :length, :admin_id).merge(admin: current_admin)
    end

end
