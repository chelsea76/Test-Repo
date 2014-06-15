class Admin < ActiveRecord::Base
  attr_accessible :user_attributes
  
  has_one :user, :as => :role, :dependent => :destroy
  
  accepts_nested_attributes_for :user
end
