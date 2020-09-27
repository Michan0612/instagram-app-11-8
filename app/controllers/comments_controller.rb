class CommentsController < ApplicationController
    before_action :forbid_logout_user

    def index
        @comment = Comment.all
        @item = Item.find(params[:item_id])
        @comments = @item.comments
    end

    def new
        item = Item.find(params[:item_id])
        @comment = item.comments.build
    end

    def create
        item = Item.find(params[:item_id])
        @comment = item.comments.build(comment_params)
        @comment.user_id = current_user.id
        @comment.save!
    
        render json: @comment
    end

    private
    def comment_params
        params.require(:comment).permit(:content)
    end
end