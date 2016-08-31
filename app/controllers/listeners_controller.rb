class ListenersController < ApplicationController
  def index
    @podcasts = Podcast.all
    @resources = Resource.all
    @articles = [
      Resource.nokogiri_data(1),
      Resource.nokogiri_data(3),
      Resource.nokogiri_data(8),
      Resource.nokogiri_data(5),
      Resource.nokogiri_data(6)
    ]
  end
end
