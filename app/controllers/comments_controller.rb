class CommentsController < ApplicationController
    before_action :authenticate_user!

    def index
        @comment = Comment.all
        @item = Item.find(params[:item_id])
        @comments = @item.comments.page(params[:page]).per(5)
    end

    def create
        item = Item.find(params[:item_id])
        @comment = item.comments.build(comment_params)
        @comment.user_id = current_user.id
        @user_name = @comment.user.display_name
        @comment.save!

        render json: @comment, include: { user: [ :profile] }
    end

    private
    def comment_params
        params.require(:comment).permit(:content)
    end
end