class LikesController < ApplicationController
    before_action :authenticate_user!

    def show
      item = Item.find(params[:item_id])
      like_status = current_user.has_liked?(item)
      render json: { hasLiked: like_status }
    end
  
    def create
      item = Item.find(params[:item_id])
      item.likes.create!(user_id: current_user.id)
      render json: { status: 'ok' }
    end

    def destroy
      item = Item.find(params[:item_id])
      like = item.likes.find_by!(user_id: current_user.id)
      like.destroy!
      render json: { status: 'ok' }
    end
end