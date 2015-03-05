class StaticPagesController < ApplicationController

  def index
    @district = (1..28).to_a
    @bedroom = (1..8).to_a
  end

  def search
    parameters = { term: params[:term], radius_filter: params[:radius_filter], limit: 16 }
    # binding.pry
    render json: Yelp.client.search(params[:location], parameters)
  end

end

