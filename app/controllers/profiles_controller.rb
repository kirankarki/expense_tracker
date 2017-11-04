class ProfilesController < InheritedResources::Base
  before_action :authenticate_user!
  before_action :set_profile_of_current_user

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to user_profile_url(current_user, @profile), notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end



  private

    def profile_params
      params.require(:profile).permit(:display_name, :phone, :dob, :city, :country, :address, :gender_id, :image, :remove_image)
    end

    def set_profile_of_current_user
      if user_signed_in?
        if profile=current_user.profile
          @profile = profile
        else
          redirect_to new_user_profile_path
        end
      else
        redirect_to new_user_session_url
      end
    end
end

