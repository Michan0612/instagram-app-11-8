class ProfilesController < ApplicationController
    before_action :authenticate_user!

    def show
      @profile = current_user.build_profile
    end
    
    def create
      @profile = current_user.build_profile
      @profile.save!

      

      render json: @profile
    end

    def edit
      @profile = current_user.build_profile
      @profile.save!

      render json: @profile
    end
end