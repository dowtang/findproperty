namespace :property_scrape do
  # this is a description of your task
  desc "Task Description Here"

  # this is your task function
  task :guru_scrape => :environment do
    # do something
  
    require 'open-uri'
    require 'nokogiri'

    # user_agent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_0) AppleWebKit/535.2 (KHTML, like Gecko) Chrome/15.0.854.0 Safari/535.2"

    (1..2412).each do |i|

      url = "http://www.stproperty.sg/property-for-sale/condo-for-sale/page#{i}"

      # document = open(url, 'User-Agent' => user_agent).read

      document = open(url).read

      # puts document

      html_doc = Nokogiri::HTML(document)
  
      property_listing_url = "div.col-xs-8 > div.row > div.col-xs-12 > h4 > a:nth-child(1)"

      propertyUrls = html_doc.css(property_listing_url)

      propertyUrls.each_with_index do |propertyURL, index|

        urlListing = "http://www.stproperty.sg/#{propertyUrls[index].attr("href")}"

        document = open(urlListing).read

        html_doc = Nokogiri::HTML(document)

        property_name = "div > div > div > div > h4.title-detail-page"
        propertyNames = html_doc.css(property_name)

        property_address = ".page-header" 
        propertyAddress = html_doc.css(property_address)

        tenure = "div.row > div:nth-child(2).col-xs-6 > div:nth-child(1).row > div:nth-child(2).col-xs-7 > a:nth-child(2)" 
        propertyTenure = html_doc.css(tenure)

        year_constructed = "div.box-col640.pull-right.default-box-detail > div.row > div:nth-child(4).col-xs-6 > div:nth-child(1).row > div:nth-child(2).col-xs-7"
        yearConstructed = html_doc.css(year_constructed)

        property_picture = "div > div > a > span > img"
        propertyPicture = html_doc.css(property_picture)

        total_beds = "div > div > div > div > span.icon-bed"
        totalBeds = html_doc.css(total_beds)

        total_bathrooms = "div > div > div > div > span.icon-bathroom"
        totalBathrooms = html_doc.css(total_bathrooms)

        posted_on = "div.box-col640.pull-right.default-box-detail > div.row > div:nth-child(5).col-xs-6 > div:nth-child(1).row > div:nth-child(2).col-xs-7"
        postDate = html_doc.css(posted_on)

        floor_area = "div.box-col640.pull-right.default-box-detail > div.row > div:nth-child(1).col-xs-6 > div:nth-child(1).row > div:nth-child(2).col-xs-7"
        floorArea = html_doc.css(floor_area)

        property_price = "div > div > div > div > a.detail-lg-link"
        propertyPrice = html_doc.css(property_price)

        propertyNames.each_with_index do |propertyName, index|

          if postDate[index] == nil
            harry = nil
          else
            harry = postDate[index].text.to_date
          end

          if propertyTenure[index] == nil
            paul = nil
          else
            paul = propertyTenure[index].text
          end

          if yearConstructed[index] == nil
            mike = nil
          else
            mike = yearConstructed[index].text
          end

          if totalBeds[index] == nil
            clement = nil
          else
            clement = totalBeds[index].text
          end

          if totalBathrooms[index] == nil
            dennis = nil
          else
            dennis = totalBathrooms[index].text
          end

          street_name = propertyAddress[index].css("a:first-child").text
          postal_code = propertyAddress[index].text.match(/\d{6}/).to_s

          project_address = street_name + " " + postal_code

          project = Project.create(
            :project_name => propertyName.text,
            :address => project_address,
            :tenure => paul,
            :year_constructed => mike,
            :picture_url => "http://www.stproperty.sg/#{propertyPicture[index].attr("data-src")}"
          )

          listing = Listing.create(
            :asking_price => propertyPrice[index].text,
            :posted_on => harry,
            :apartment_size => floorArea[index].text,
            :number_of_beds => clement,
            :number_of_bathrooms => dennis
          )

          puts project
          puts listing

        end
      end
    end
  end
end

