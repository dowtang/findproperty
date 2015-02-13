namespace :scrape_tripadvisor do
  # this is a description of your task
  desc "Scrape the list of To Do Things in Singapore"

  # this is your task function
  task :scrape_todo => :environment do
    # do something
      require 'open-uri'
      require 'nokogiri'

      url = "http://www.tripadvisor.com/Attractions-g294265-Activities-c26-Singapore.html#TtD"

      document = open(url).read

      html_doc = Nokogiri::HTML(document)

      attraction_name = "div > div > div > span > a.property_title"
      # todoNames = html_doc.css(attraction_name).text
      # todoNamesUrl = html_doc.css(attraction_name).map{|element| element["href"]}.compact      
      # # puts html_doc

      todoNames = html_doc.css(attraction_name)
      todoNamesUrl = html_doc.css(attraction_name)
      # puts html_doc

      todoNames.each_with_index do |todoName, index|
        puts "-------------------"
        puts index
        puts "Attraction Name: #{todoName.text.squish}"
        puts "Attraction Name URL: http://www.tripadvisor.com#{todoNamesUrl[index].attr("href")}"
      end
      # attraction_ranking = "div > div > div > div > b"

      # attraction_picture = "div.wrap.al_border.attraction_element > div.attr_thumb.non_generic > a.photo_link > div.sizedThumb > img.photo_image"


      # puts 

      # todoRankings = html_doc.css(attraction_ranking)
      # todoPictures = html_doc.css(attraction_picture)

      # Attraction.create(
      # :name => name.text,
      # :ranking => 
      # :picture => 
      # )
      # end

  end
end