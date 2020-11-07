class Apps::FollowersController < Apps::ApplicationController
    def index
      @user = User.find(params[:account_id])
    end
end