# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  layout 'not_authenticated'

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
  end
end
