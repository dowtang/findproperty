json.text "hello"
json.hi "hi dow"
json.listings @listings.each do |listing|
  json.id listing.id
  json.asking_price listing.asking_price
  json.apartment_size listing.apartment_size
  json.number_of_beds listing.number_of_beds
  json.number_of_bathrooms listing.number_of_bathrooms

  json.project_name listing.project.project_name
  json.address listing.project.address
  json.tenure listing.project.tenure
  json.year_constructed listing.project.year_constructed
  json.picture_url listing.project.picture_url
  json.district_number listing.project.district_number
  json.postal_district listing.project.postal_district
end

