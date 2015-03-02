class AddDistrictNumberToProject < ActiveRecord::Migration
  def change
    add_column :projects, :district_number, :string
  end
end
