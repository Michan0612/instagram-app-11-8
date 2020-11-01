class Item < ApplicationRecord
    belongs_to :user
    has_many_attached :photos
    has_many :likes, dependent: :destroy
    has_many :comments, dependent: :destroy

    validates :photos, presence: true
end