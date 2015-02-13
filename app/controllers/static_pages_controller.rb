class StaticPagesController < ApplicationController

  def index
  end

  def search
    parameters = { term: params[:term], limit: 16 }
    render json: Yelp.client.search('Singapore', parameters)
  end

end
