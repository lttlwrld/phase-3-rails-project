class Ride < ActiveRecord::Base

    has_many :comments
    has_many :ride_users
    has_many :users, :through => :ride_users

end
