class Users::RegistrationsController < Devise::RegistrationsController
  def create
    build_resource(sign_up_params)

    # set default role and status here
    resource.role = :user
    resource.status = :pending_verification

    resource.profile_pic.attach(params[:user][:profile_pic])

    resource.save
    yield resource if block_given?
    if resource.persisted?
      ContactInfo.create(telegram_id: params[:user][:telegram_id], phone: params[:user][:phone], user: resource)
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:nickname, :password, :password_confirmation, :email, :name, :surname, :about_me, :company, :position, :profile_pic, contact_info: [:id, :telegram_id, :phone])
  end

  def account_update_params
    params.require(:user).permit(:nickname, :password, :password_confirmation, :current_password, :email, :name, :surname, :about_me, :company, :position, :activity_status, :is_rejected, :reject_date, :reject_reason, :is_banned, :ban_date, :ban_reason, :profile_pic)
  end
end
