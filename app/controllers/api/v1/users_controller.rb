class Api::V1::UsersController < ApplicationController

  def create
    # require "pry"; binding.pry
    user = User.new(user_params)
    # user = User.create(user_params)
    # require "pry"; binding.pry
    if params[:password] != params[:password_confirmation]
      render json: { error: "passwords do not match"}, status: :bad_request
    elsif params[:email].nil? || params[:password].nil? || params[:password_confirmation].nil?
      render json: { error: "missing a field"}, status: :bad_request
    elsif User.find_by(email: params[:email])
      render json: { error: "email already exists"}, status: :bad_request
    else
      user.save
      render json: UserSerializer.new(user), status: 201
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation, :auth_token)
    # params.require(:user).permit(:email, :password, :password_confirmation, :auth_token)
  end
end
