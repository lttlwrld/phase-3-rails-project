class User < ActiveRecord::Base

    has_secure_password
    has_many :bikes
    has_many :rides_created, class_name: "Ride"
    has_many :components, :through =>  :bikes
    has_many :participants
    has_many :rides, :through => :participants

    validates_presence_of :username, :name, :email, :password
    validates :username, format: { with: /\A[a-zA-Z0-9]+\Z/ }
    validates :username, uniqueness: true
    validates :email, uniqueness: true

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

    def current_ride_stats(ride)
        participants.find_by(ride_id: ride.id)
    end

end
