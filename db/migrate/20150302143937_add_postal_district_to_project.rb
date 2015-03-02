class AddPostalDistrictToProject < ActiveRecord::Migration
  def change
    add_column :projects, :postal_district, :string
  end
end
