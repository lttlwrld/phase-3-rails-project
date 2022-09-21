class User < ActiveRecord::Base

    has_secure_password
    has_many :comments
    has_many :bikes
    has_many :rides
    has_many :components, :through =>  :bikes
    has_many :ride_users
    has_many :rides, :through => :ride_users

    def self.leaderboard
        user_miles = {}
        self.all.each do |user|
            user_miles[user] = user.mileage
        end
        user_miles.sort_by {|k, v| -v}
    end

    def mileage
        miles = 0
        rides.each do |ride|
            if ride.completed
                miles += ride.distance.to_i
            end
        end
        miles
    end

end
