class PasswordResetsController < ApplicationController
  before_action :get_user,    only: [:edit, :update]
  before_action :valid_user,  only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update] # case 1


  def new
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = "Email sent with password reset instructions"
      redirect_to root_url
    else
      flash.now[:danger] = "Email address not found"
      render :new
    end
  end

  def edit
    # renders the reset form
  end

  def update
    # case 3: password can’t be blank
    if params[:user][:password].blank?
      @user.errors.add(:password, "can't be empty")
      return render :edit
    end

    # case 4 attempt update
    if @user.update(user_params)
      log_in @user
      # optional: log_in(@user) if your app supports it here
      @user.update_attribute(:reset_digest, nil) # invalidate the token
      flash[:success] = "Password has been reset."
      redirect_to @user
    else
      render :edit #case 2
    end
  end

  private

    def user_params
      params.require(:user).permit(:password, :password_confirmation)
    end

    def get_user
      @user = User.find_by(email: params[:email])
    end

    def valid_user
      unless (@user && @user.activated? && @user.authenticated?(:reset, params[:id]))
        redirect_to root_url
      end
    end
    # Checks expiration of reset token.
    def check_expiration
      if @user.password_reset_expired?
        flash[:danger] = "Password reset has expired."
        redirect_to new_password_reset_url
      end
    end
end
