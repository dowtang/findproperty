class StaticPagesController < ApplicationController

  def index
  end

  def search
    parameters = {term: params[:term], limit: 20, radius_filter: params[:radius_filter]}
    render json: Yelp.client.search('San Francisco', parameters)

  end

end
