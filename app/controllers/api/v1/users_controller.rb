class Api::V1::UsersController < ApplicationController
  before_each :generate_access_token
  
  def create
    user = User.create(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
