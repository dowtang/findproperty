desc "Get Lat and Long data"

task :get_coordinates => :environment do 
  require 'open-uri'


  Project.all.each do |project|
     
    url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{project.address}&key=AIzaSyBfnbXBL1aRWaWFw3dZDHUqCtuCZ1457-E"

    document = open(url).read

  end
end

