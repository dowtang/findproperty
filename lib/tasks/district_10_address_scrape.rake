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

      # property_tenure_format = "div.col-xs-8 > div.row > div:nth-child(1).col-xs-4 > strong:nth-child(1) > a:nth-child(1)" 
      # propertyTenure = html_doc.css(property_tenure_format)

      # property_top_format = "div > div > div.col-xs-8 > strong > a" 
      # propertyTop = html_doc.css(property_top_format)

      propertyNames.each_with_index do |name, index|

        puts "---------------------"
        puts index
        puts "Property Name: #{name.text.squish}"
        # puts "Property Address: #{propertyAddress[index].text.squish}"

        prop_add = propertyAddress[index].text.squish.titleize
        prop_name = name.text
        # prop_top = propertyTop[index].text
        # prop_tenure = propertyTenure[index].text

        # puts prop_top

        # find if a project has the same name

        # if project = Project.find_by_project_name(prop_name)
        
        if project = Project.find_by(:project_name => prop_name)
          
          project.update_attributes(:address => prop_add)
          # project.update_attributes(:tenure => prop_tenure)
          # project.update_attributes(:year_constructed => prop_top)
          puts "PROPERTY: #{project.project_name} - updated w/ address:#{project.address}"
        else
          puts "Project not found, should mean that there are no listings"
        end
      end
    end
  end
end
