class User < ActiveRecord::Base

  has_secure_password

  has_and_belongs_to_many :tables

  validates :name, :email, :password, :password_confirmation, presence:true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create	

end
