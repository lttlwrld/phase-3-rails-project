class Ride < ActiveRecord::Base

    belongs_to :user
    has_many :comments
    has_many :ride_users
    has_many :users, :through => :ride_users

end
