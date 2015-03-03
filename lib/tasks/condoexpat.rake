namespace :property_scrape do
  # this is a description of your task
  desc "Task Description Here"

  # this is your task function
  task :expat_scrape => :environment do
    # do something
  
    require 'open-uri'
    require 'nokogiri'

    # user_agent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_0) AppleWebKit/535.2 (KHTML, like Gecko) Chrome/15.0.854.0 Safari/535.2"

    (1..57).each do |i|

      url = "http://condo.singaporeexpats.com/#{i}/singapore-condo" 

      document = open(url).read

      html_doc = Nokogiri::HTML(document)

      property_condo_name = "div > div > div > div > a.title_link"
      condoNames = html_doc.css(property_condo_name)

      property_listing_address = "div > div.listcontainer > div.infocontainer > div.listcolumn1 > div:nth-child(2)"
      condoAddress = html_doc.css(property_listing_address)

      puts condoNames
      puts condoAddress

      # condoNames.each_with_index do |condoName, index|

      #   my_address_string = condoAddress[index].text

      #   final_address = my_address_string.gsub("Address:","")
        
      #   puts final_address

      # end
    end
  end
end



