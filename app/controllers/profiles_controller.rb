class ProfilesController < ApplicationController
    before_action :authenticate_user!

    def show
      @profile = current_user.profile
    end

    def edit
      @profile = current_user.prepare_profile
<<<<<<< HEAD
    end

    # def update 
    #   @profile = current_user.prepare_profile
    #   @profile.assign_attributes(profile_params)
    #   @profile.save!

    #   render json: @profile
    # end

    def create
      @profile = current_user.build_profile(profile_params)
      @profile.save!
      
      render json: @profile
=======
    end

    # def update 
    #   @profile = current_user.prepare_profile
    #   @profile.assign_attributes(profile_params)
    #   if @profile.save!
    #     redirect_to profile_path, notice: 'プロフィール更新'
    #   else
    #     flash.now[:error] = '更新できませんでした'
    #   end
    # end

    def create
      @profile = current_user.build_profile(profile_params)
      if @profile.save!
        redirect_to profile_path, notice: 'プロフィール更新'
      else
        flash.now[:error] = '更新できませんでした'
      end
    end
    
    
    private
    def profile_params
      params.require(:profile).permit(:avatar)
>>>>>>> master
    end
    
    
    private
    def profile_params
      params.require(:profile).permit(:avatar)
    end
end