class Ride < ActiveRecord::Base

    belongs_to :user
    has_many :participants
    has_many :users, :through => :participants

    scope :leaderboard, -> { order('distance desc') }

    validates_presence_of :name, :date, :location, :category, :distance, :about
    validates :distance, numericality: { only_integer: true }
    
end
