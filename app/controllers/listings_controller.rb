class ListingsController < ApplicationController

  def search
    # grab the (4 to 7) params

    # do the query, get the listings
    @listings = Listing.includes(:project).all.limit(5)
    # puts @listings
    # render the listings in json format
    # render json: @listings

  end

end
