class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|

      t.decimal :total_price
      t.integer :area_sq
      t.string :type_of_area
      t.string :floor_level
      t.decimal :price_per_square_foot
      t.string :date_of_sale

      t.integer :asking_price
      t.date    :posted_on
      t.integer :apartment_size
      t.integer :number_of_beds
      t.integer :number_of_bathrooms

      t.boolean :past
      t.integer :project_id

      t.timestamps
    end
  end
end
