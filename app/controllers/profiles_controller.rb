class ProfilesController < ApplicationController
    before_action :authenticate_user!

    def show
      
    end

    def update 
      @profile = current_user.profile.find(params[:id])
      @profile.save

      render json: @profile
    end
end