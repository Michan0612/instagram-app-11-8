class ProfilesController < ApplicationController
    before_action :authenticate_user!

    def show
      @profile = current_user.build_profile
    end

    def update 
      @profile = current_user.profile || current_user.build_profile
      @profile.assign_attributes(profile_params)

      binding.pry

      if @profile.save
        flash[:notice] = '更新できました'
      else
        flash.now[:error] = '更新できませんでした'
      end

      render json: @profile
    end

    private
    def profile_params
      params.require(:profile).permit(:avatar)
    end

end