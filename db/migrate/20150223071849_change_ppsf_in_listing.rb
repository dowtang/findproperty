class ChangePpsfInListing < ActiveRecord::Migration
  def change
    rename_column :listings, :ppsf, :price_per_square_foot
  end
end
