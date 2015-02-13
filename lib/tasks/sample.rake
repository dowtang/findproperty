namespace :sample_scrape do
  # this is a description of your task
  desc "Task Description Here"

  # this is your task function
  task :dow_scrape => :environment do
    # do something
  
    require 'open-uri'
    require 'nokogiri'

    url = "http://www.tripadvisor.com/Attraction_Review-g294265-d317453-Reviews-National_Orchid_Garden-Singapore.html"

    document = open(url).read

    html_doc = Nokogiri::HTML(document)


# PAULS STUFF
    # html_doc.search("script").each do |script|
    #   puts script.text.scan(/(lng:).*\d*\.\d*/)
    # end
# END OF PAULS STUFF



    # puts html_doc.search(/(lng:).\d*\.\d*/)
    # puts html_doc.search("script").text.each do |script|
    #   puts script
    #   puts '--------------'
    # end

    # .text.gsub(/(lng:).\d*\.\d*/)

    # attraction_address = "div > address > span > span > span"
    # attraction_phone = "div > div > div > div > div.fl.phoneNumber"
    # attraction_map = "div > div > div > span.mapWxH > img"

    # addresses = html_doc.css(attraction_address)
    # phones = html_doc.css(attraction_phone)
    # maps = html_doc.css(attraction_map)

    #   addresses.each_with_index do |address, index|
    #     puts "-------------------"
    #     puts index
    #     puts "Attraction ADDRESS: #{addresses.text.squish}"
    #     puts "Attraction PHONE NUMBER: #{phones[index].text.squish}"
    #     puts "Attraction MAP SRC: #{maps[index].attr("src")}"
    #   end





  end
end
