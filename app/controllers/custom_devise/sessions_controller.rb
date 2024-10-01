# frozen_string_literal: true
class CustomDevise::SessionsController < Devise::SessionsController
  # https://github.com/plataformatec/devise/blob/master/app/controllers/devise/sessions_controller.rb

  # POST /users/sign_in
  # Resets the authentication token each time! Won't allow you to login on two devices
  # at the same time (so does logout).
  def create
    email= auth_params[:email].downcase if auth_params[:email].present?
    password = auth_params[:password] if auth_params[:password].present?
    user = User.find_by(email: email)

    if user.present? && user.valid_password?(password) 
      sign_in(user, store: false)
      user.update(authentication_token: nil)
      response.set_header('Content-Type', 'application/javascript')
      render json: { authentication_token: user.authentication_token }, status: :ok
    else
      render json: {}.to_json, status: :unauthorized
    end
  end

  def auth_params
    params.permit(:password, :email)
  end
end