namespace :ten_scrape do
  # this is a description of your task
  desc "Task Description Here"

  # this is your task function
  task :st_scrape => :environment do
    # do something
  
    require 'open-uri'
    require 'nokogiri'

    (1..7).each do |i|

      url = "http://www.stproperty.sg/condominium-directory/district-tanglin-road-farrer-holland-bukit-timah-ardmore-10/page#{i}/size-50/sort-name-asc/box-1"

      document = open(url).read

      html_doc = Nokogiri::HTML(document)

      property_name = "div > div > div.col-xs-12 > h4 > a"
      propertyNames = html_doc.css(property_name)

      property_address_format = "div.col-xs-12 > div.row > div.col-xs-8 > div:nth-child(2).row > div:nth-child(1).col-xs-12" 
      propertyAddress = html_doc.css(property_address_format)

      propertyNames.each_with_index do |name, index|

        puts "---------------------"
        puts index
        puts "Property Name: #{name.text.squish}"
        # puts "Property Address: #{propertyAddress[index].text.squish}"

        prop_add = propertyAddress[index].text.squish.titleize
        prop_name = name.text

        # find if a project has the same name

        if project = Project.find_by_project_name(prop_name)
        # if project = Project.find_by(:project_name => prop_name)
          project.update_attributes(:address => prop_add)
          puts "PROPERTY: #{project.project_name} - updated w/ address:#{project.address}"
        else
          puts "Project not found, should mean that there are no listings"
        end
      end
    end
  end
end
