namespace :address_scrape do
  # this is a description of your task
  desc "Task Description Here"

  # this is your task function
  task :st_scrape => :environment do
    # do something
  
    require 'open-uri'
    require 'nokogiri'

    (1..242).each do |i|

      url = "http://www.stproperty.sg/condominium-directory/page#{i}/box-1#searchresults"

      document = open(url).read

      html_doc = Nokogiri::HTML(document)

      property_name = "div > div > div.col-xs-12 > h4 > a"
      propertyName = html_doc.css(property_name).text

      property_address = "div.col-xs-12 > div.row > div.col-xs-8 > div:nth-child(2).row > div:nth-child(1).col-xs-12" 
      propertyAddress = html_doc.css(property_address).text

      project = Project.find_by_project_name(propertyName)

      if project != nil
        puts "success!"
        project.update(:address => propertyAddress)
      end

    end
  end
end
