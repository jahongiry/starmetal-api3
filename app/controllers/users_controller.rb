class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      render json: { user: @user, jwt: issue_token({ user_id: @user.id }) }, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      render json: { jwt: issue_token({ user_id: @user.id }) }
    else
      render json: { errors: 'Invalid email or password' }, status: :unauthorized
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password)
  end
end
