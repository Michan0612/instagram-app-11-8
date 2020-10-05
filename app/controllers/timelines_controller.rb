class TimelinesController < ApplicationController
    def show
        # user_ids = current_user.followings.pluck(:id)
        # @items = Item.joins(:likes).where(user_id: user_ids)
        user_ids = current_user&.followings&.pluck(:id)
        @items = Item.where(user_id: user_ids, created_at: Time.now - 24.hour..Time.now)
        
        item_like_count = @items.joins(:likes).group(:item_id).count
        item_liked_ids = Hash[item_like_count.sort_by{ |_, v| -v }].keys
        @item_rankings= Item.find(item_liked_ids)
    end
end