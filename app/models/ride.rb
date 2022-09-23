class Ride < ActiveRecord::Base

    belongs_to :user
    has_many :comments
    has_many :ride_users
    has_many :users, :through => :ride_users

    validates_presence_of :name, :date, :location, :category, :distance, :about
    validates :distance, numericality: { only_integer: true }

end
