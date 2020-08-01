class ProfilesController < ApplicationController
    before_action :authenticate_user!

    def show
      @profile = current_user.build_profile
    end

    def update
      @profile = current_user.build_profile
      if @profile.save
        redirect_to profile_path, notice: 'プロフィール更新'
      end
    end
      
    def create
      @profile = current_user.build_profile
      @profile.save!

      render json: @profile
    end
end