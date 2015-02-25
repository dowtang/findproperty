class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :project_name
      t.text :address
      t.string :tenure
      t.integer :year_constructed
      t.string :picture_url
      t.string :street_name
      t.string :dwelling_type
      t.string :postal_district
      t.string :market_segment
      t.timestamps
    end
  end
end
