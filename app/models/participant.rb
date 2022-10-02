class Participant < ActiveRecord::Base

    belongs_to :user
    belongs_to :ride

    validates :time, format: { with: /(?:[0123456789]\d):(?:[012345]\d):(?:[012345]\d)/, allow_blank: true }

    scope :ride, ->(id) { where(ride_id: id) }
    scope :leaderboard, -> { order('speed desc') }

end