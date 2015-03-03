class AddProjectnameAndAddressToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :projectname, :string
    add_column :addresses, :address, :string
  end
end
