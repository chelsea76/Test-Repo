class User < ActiveRecord::Base
  devise :database_authenticatable

  attr_accessible :email, :password, :password_confirmation
  
  belongs_to :role, polymorphic: true
  
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, uniqueness: true
  validates :password, presence: true
end
