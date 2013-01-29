class Organization < ActiveRecord::Base
  
  # Accessible attributes for the model
  attr_accessible :name

  # Associations
  belongs_to :user
end
