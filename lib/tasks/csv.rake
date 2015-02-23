desc "Scrape companies"

task :make_companies => :environment do 
  require 'open-uri'
  require 'csv'

  file_path = "lib/tasks/district_eleven.csv"

  # file_data = open(file_path)

  CSV.foreach(file_path, :headers => true) do |row|
    
    # puts "#{sn}"
    # puts "#{project_name}"
    # puts "#{street_name}"
    # puts "#{type}"
    # Companyname.create(name: "#{name}", symbol: "#{symbol}")
    
    Listing.create(
      :sn => row["sn"],
      :project_name => row["project_name"],
      :street_name => row["street_name"],
      :dwelling_type => row["type"],
      :postal_district => row["postal_district"],
      :market_segment => row["market_segment"],
      :tenure => row["tenure"],
      :number_of_units => row["number_of_units"],
      :total_price => row["total_price"],
      :area_sq => row["area_sq"],
      :type_of_area => row["type_of_area"],
      :floor_level => row["floor_level"],
      :ppsf => row["ppsf"],
      :date_of_sale => row["date_of_sale"]
    )
  
  end
end