class User < ActiveRecord::Base

    has_secure_password
    has_many :comments
    has_many :ride_users
    has_many :rides, :through => :ride_users

end
