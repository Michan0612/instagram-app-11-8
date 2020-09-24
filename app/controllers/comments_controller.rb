def index
    item = Item.find(params[:item_id])
    comments = item.comments
    render json: comments
end
