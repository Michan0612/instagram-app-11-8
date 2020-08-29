class ProfilesController < ApplicationController
    before_action :authenticate_user!

    def show
      @profile = current_user.profile
    end

    def edit
      @profile = current_user.prepare_profile
    end

    # def update 
    #   @profile = current_user.prepare_profile
    #   @profile.assign_attributes(profile_params)
    #   @profile.save!

    #  render json: @profile

    def create
      @profile = current_user.build_profile(profile_params)
      if @profile.save!
        @profile.parse_base64(params.require(:profile).permit(:avatar))

        render json: @profile, status: :created, location: @profile
      else
        render json: @profile.errors, status: :unprocessable_entity
      end
    end
    
    
    private
    def profile_params
      params.require(:profile).permit(:avatar)
    end
end