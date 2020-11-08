class Api::FollowersController < Api::ApplicationController
    def index
      @user = User.find(params[:account_id])
    end
end