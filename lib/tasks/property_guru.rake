namespace :property_scrape do
  # this is a description of your task
  desc "Task Description Here"

  # this is your task function
  task :guru_scrape => :environment do
    # do something
  
    require 'open-uri'
    require 'nokogiri'

    # user_agent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_0) AppleWebKit/535.2 (KHTML, like Gecko) Chrome/15.0.854.0 Safari/535.2"

    (1..2).each do |i|

      url = "http://www.stproperty.sg/property-for-sale/page#{i}"

      # document = open(url, 'User-Agent' => user_agent).read

      document = open(url).read

      # puts document

      html_doc = Nokogiri::HTML(document)
  
      property_listing_url = "div.col-xs-8 > div.row > div.col-xs-12 > h4 > a:nth-child(1)"
      # property_listing_url = ".listing_action"

      #grabbed each of the links on page "i"
      propertyUrls = html_doc.css(property_listing_url)

      propertyUrls.each_with_index do |propertyURL, index|

        urlListing = "http://www.stproperty.sg/#{propertyUrls[index].attr("href")}"

        document = open(urlListing).read

        html_doc = Nokogiri::HTML(document)

        property_name = "div > div > div > div > h4.title-detail-page"
        propertyNames = html_doc.css(property_name)

        property_address = ".page-header" 
        propertyAddresses = html_doc.css(property_address)

        # property_street_name = "div.box-col640.pull-right > div.page-header > h4.title-detail-page > p > a:nth-child(1)" 
        # propertyStreetNames = html_doc.css(property_street_name)

        # property_postal_code = "div > div > div > h4 > p"
        # propertyPostalCodes = html_doc.css(property_postal_code)

        total_bed = "div > div > div > div > span.icon-bed"
        totalBeds = html_doc.css(total_bed)

        floor_area = "div.box-col640.pull-right.default-box-detail > div.row > div:nth-child(1).col-xs-6 > div:nth-child(1).row > div:nth-child(2).col-xs-7"
        floorAreas = html_doc.css(floor_area)

        property_price = "div > div > div > div > a.detail-lg-link"
        propertyPrices = html_doc.css(property_price)

        propertyNames.each_with_index do |propertyName, index|

          puts "______________"
          puts index
          puts "PROPERTY NAME: #{propertyNames[index]}"
          puts "PROPERTY ADDRESS: #{propertyAddresses[index]}"
          # puts "PROPERTY POSTAL CODE: #{propertyPostalCodes}"
          puts "TOTAL BEDS: #{totalBeds[index]}"
          puts "FLOOR AREA: #{floorAreas[index]}"
          puts "PROPERTY PRICE: #{propertyPrices[index]}"
        end       
      end
    end

    # for (var i; i < 2049; i++) {
    #   var scroll = http://www.propertyguru.com.sg/singapore-property-listing/property-for-sale/#{i};
    #   console.log(scroll);
    # } 

    # = "http://www.propertyguru.com.sg/singapore-property-listing/property-for-sale/1"

    # property_listing_url = "form > ul > li.listing_corp > div.listing_info > a.infotitle.listing_action.clearfix"

    # propertyUrls = html_doc.css(property_listing_url)

    # propertyUrls.each_with_index do |propertyURL, index|

    #   puts "-------------------"
    #   puts index
    #   puts "Property URL: http://www.propertyguru.com.sg/#{propertyUrls[index].attr("href")}"
    #   end

  end
end

