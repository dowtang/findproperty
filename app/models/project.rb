class Project < ActiveRecord::Base

  has_many :listings

  has_many :likes

  

end
