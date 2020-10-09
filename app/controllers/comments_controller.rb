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
        @user_name = @comment.user.display_name
        @comment.save!
    
        respond_to do |format|
            format.html { redirect_to :root }
            format.json { render 'create.json.jbuilder' }
            # handlersで、 拡張子「.jbuilder」のファイルだと指定している。
            # format.json { render 'messages.json.jbuilder' }と書いても可
        end
    end

    private
    def comment_params
        params.require(:comment).permit(:content)
    end
end