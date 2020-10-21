class Like < ApplicationRecord
    belongs_to :user
    belongs_to :item

    validates :post_id, uniqueness: { scope: :user_id }
end
