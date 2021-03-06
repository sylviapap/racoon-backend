class MapMarker < ApplicationRecord
    has_many :bookmarks, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :users, through: :comments, dependent: :destroy

    belongs_to :creator, class_name: 'User', foreign_key: :user_id

    validates :latitude, numericality: true
    validates :longitude, numericality: true
end