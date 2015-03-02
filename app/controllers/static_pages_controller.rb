class StaticPagesController < ApplicationController

  def index
  end

  def search
    parameters = { term: params[:term], radius_filter: params[:radius_filter], limit: 16 }
    binding.pry
    render json: Yelp.client.search(params[:location], parameters)
  end

end

