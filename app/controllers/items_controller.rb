class ItemsController < ApplicationController
    def show
        @item = Item.find_by(id: params[:id])
    end

    def new
        @item = current_user.items.build
    end

    def create
        @item = current_user.items.build(item_params)
        if @item.save
          redirect_to root_path, notice: '保存できました'
        else
          flash.now[:error] = '保存に失敗しました'
          render :new
        end
    end

    private 
    def item_params
      params.require(:item).permit(:content, {photos: []})
    end
    

end