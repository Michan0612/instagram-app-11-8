class TimelinesController < ApplicationController
    def show
        user_ids = current_user.followings.pluck(:id)
        @items = Item.where(user_id: user_ids)
    end
end