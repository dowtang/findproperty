class ListingsController < ApplicationController

  def search
    
    # district
    if params[:district]
      # specify the query with district
      districtNumber =  "(D#{params[:district]})"
      @listings = Listing.includes(:project)
                         .where(projects: {district_number: districtNumber})
                         .where.not(projects: {address: nil})
    else
      # Start the query will ALL Listings
      @listings = Listing.includes(:project)
                         .where.not(projects: {address: nil})
    end
    
    # specify the query with minPrice
    # params[:minPrice]
    @listings = @listings.where("asking_price > ?", params[:minPrice])

    # specify the query with maxPrice
    # params[:maxPrice]
    @listings = @listings.where("asking_price < ?", params[:maxPrice])
    # specify the query with minFootage
    # params[:minFootage]
    @listings = @listings.where("apartment_size > ?", params[:minFootage])
    # specify the query with maxFootage
    # params[:maxFootage]
    @listings = @listings.where("apartment_size < ?", params[:maxFootage])



    # specify the query with minBedroom
    if params[:minBedroom]
      @listings = @listings.where("number_of_beds >= ?", params[:minBedroom])
    end

    # specify the query with maxBedroom
    # params[:maxBedroom]
    if params[:maxBedroom]
      @listings = @listings.where("number_of_beds <= ?", params[:maxBedroom])
    end

    # @listings = @listings.limit(5)

    # @listings = @listings.
    # puts @listings
    # render the listings in json format
    # render json: @listings

  end

end
