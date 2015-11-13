class User < ActiveRecord::Base

  has_secure_password

  has_and_belongs_to_many :tables

  validates :name, :email, :password, :password_confirmation, presence:true

end
