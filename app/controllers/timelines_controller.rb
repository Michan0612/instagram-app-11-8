class TimelinesController < ApplicationController
    def show
        # user_ids = current_user.followings.pluck(:id)
        # @items = Item.joins(:likes).where(user_id: user_ids)
        # user_ids = current_user&.followings&.pluck(:id)
        # @items = Item.where(user_id: user_ids, created_at: 1.week.ago.all_day)

        # item_like_count = @items&.joins(:likes)&.group(:item_id).count
        # item_liked_ids = Hash[item_like_count.sort_by{ |_, v| -v }]&.keys
        # @item_rankings= Item&.find(item_liked_ids).page(params[:page]).per(5)

        user_ids = current_user&.followings.pluck(:id)
        @items = Item&.where(user_id: user_ids).page(params[:page]).per(5)
    end
end