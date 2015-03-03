desc "Scrape companies"

task :make_companies => :environment do 
  require 'open-uri'
  require 'csv'

  file_path = "lib/tasks/district_eleven.csv"

  CSV.foreach(file_path, :headers => true) do |row|
    
    nice_project_name = row['project_name'].downcase.titleize
    puts nice_project_name

      if project = Project.find_by(:project_name => nice_project_name)
      else
        project = Project.create(
          :project_name => nice_project_name,
          :street_name => row["street_name"], 
          :dwelling_type => row["type"], 
          :postal_district => row["postal_district"], 
          :tenure => row["tenure"], 
          :market_segment => row["market_segment"]
        )
      end

      project.listings.create(
        :total_price => row["total_price"], 
        :area_sq => row["area_sq"], 
        :type_of_area => row["type_of_area"], 
        :floor_level => row["floor_level"], 
        :price_per_square_foot => row["ppsf"],
        :postal_district => row["postal_district"], 
        :date_of_sale => row["date_of_sale"] 
      )
  end
end