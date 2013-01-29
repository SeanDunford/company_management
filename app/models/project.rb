class Project < ActiveRecord::Base
  
  # Accessible attributes for the model
  attr_accessible :title, :description, :organization_id

  # Associations
  belongs_to :organization

end
