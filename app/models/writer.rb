class Writer < ActiveRecord::Base
  attr_accessible :first_name, :gender, :last_name, :screen_name, :user_attributes
  
  has_one :user, :as => :role, :dependent => :destroy
  
  accepts_nested_attributes_for :user
  
  validates :first_name, :last_name, :screen_name, :gender , presence: true
end
