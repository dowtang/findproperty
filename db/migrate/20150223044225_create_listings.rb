class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|

      t.string :sn
      t.string :project_name
      t.string :street_name 
      t.string :dwelling_type
      t.string :postal_district
      t.string :market_segment
      t.string :tenure
      t.string :number_of_units
      t.string :total_price
      t.string :area_sq
      t.string :type_of_area
      t.string :floor_level
      t.string :ppsf
      t.string :date_of_sale

      t.timestamps
    end
  end
end
