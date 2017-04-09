class ProfilesController < ApplicationController
  before_action :set_form, only: [:edit, :update]

  def edit
    @user = current_user
  end

  def update
    if current_user.update profile_params
      flash[:success] = t "update.success", resource: t("resource.profile")
      if params[:reload]
        redirect_to edit_profile_path
      else
        redirect_to root_path
      end
    else
      @user = current_user
      render "edit"
    end
  end

  private
  def set_form
    @form = Support::UserForm.new
  end

  def profile_params
    params.require(:user).permit :name, :gender, :blood_type, :id_number, :phone_number, :address, :avatar
  end
end
