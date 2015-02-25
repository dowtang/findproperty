desc "Scrape companies"

task :make_companies => :environment do 
  require 'open-uri'
  require 'csv'

  file_path = "lib/tasks/district_eleven.csv"

  # file_data = open(file_path)

  # proper_project_name = []

  CSV.foreach(file_path, :headers => true) do |row|
    
    nice_project_name = row['project_name'].downcase.titleize
    puts nice_project_name
    # project_name << row

      if project = Project.find_by(:project_name => nice_project_name)
        # nothing happens, jump to create listing
      else
        project = Project.create(
          :project_name => nice_project_name,
          :street_name => row["street_name"], #P
          :dwelling_type => row["type"], #P
          :postal_district => row["postal_district"], #P
          :tenure => row["tenure"], #P
          :market_segment => row["market_segment"]
        )
      end

      project.listings.create(
         #
        :total_price => row["total_price"], #L
        :area_sq => row["area_sq"], #L
        :type_of_area => row["type_of_area"], #L
        :floor_level => row["floor_level"], #L
        :price_per_square_foot => row["ppsf"], #L
        :date_of_sale => row["date_of_sale"] #L
      )


# if there is a project with this name ======>>>>> once you find it, store that project into a variable called project
  # for that project, create a new listing

# else create a new project and store that project intoa variable called project
# for that project, create a new listing

    
    # get the name, change "NAME" to "Name"
    
    # step 1 = check if property exists

    # if doesn't exist, create it

    # then for this property, create a new listing that belongs to the property




    # puts "#{sn}"
    # puts "#{project_name}"
    # puts "#{street_name}"
    # puts "#{type}"
    # Companyname.create(name: "#{name}", symbol: "#{symbol}")
    
    # Listing.create(
    # )
  
  end
end