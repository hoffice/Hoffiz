class Users::RegistrationsController < Devise::RegistrationsController
before_filter :configure_sign_up_params, only: [:create]
before_filter :configure_account_update_params, only: [:update]

  def update
    # For Rails 4
    #account_update_params = devise_parameter_sanitizer.sanitize(:account_update)
    # For Rails 3
    # account_update_params = params[:user]

    # required for settings form to submit when password is left blank

    @user = User.find(current_user.id)
    unless @user.blank?
      if update_resource(account_update_params)
        set_flash_message :notice, :updated
        # Sign in the user bypassing validation in case their password changed
        sign_in @user, :bypass => true
        redirect_to edit_user_registration_path 
      else
        render "edit"
      end
    else 
      render "edit"
    end
  end

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # You can put the params you want to permit in the empty array.
  def configure_sign_up_params
    devise_parameter_sanitizer.for(:sign_up) << :firstname
  end

  #You can put the params you want to permit in the empty array.
  def configure_account_update_params
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :current_password, :firstname, :lastname, :facebook_url, :twitter_url, :linkedin_url) }
  end

  def update_resource(details)

    if current_user.provider || (params[:user][:password].blank? && params[:user][:password_confirmation].blank?)
      @user.update_without_password(details)
    else
      @user.update_with_password(details)
    end
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
