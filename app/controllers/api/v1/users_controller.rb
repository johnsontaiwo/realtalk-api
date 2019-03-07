class Api::V1::UsersController < ApplicationController
  def index 
    @users = User.all
    render json: @users
  end

  def show
    # @user = User.find_by(id: params[:id])
    # render json: @user
    ##render json: get_current_user
  end

  def create
    @user = User.create(user_params)
    if @user.save
      jwt = Auth.encrypt({ user_id: @user.id })
      render json: { jwt: jwt, current: UserSerializer.new(@user) }
    else
      render json: { error: 'Failed to Sign Up' }, status: 400
    end
  end

  def login
    user = User.find_by(email: user_params[:email])
      if user && user.authenticate(params[:user][:password])
        jwt = Auth.encrypt({ user_id: user.id })
        render json: { jwt: jwt, current: user }
      else
        render json: { error: 'Failed to Log In' }, status: 400
      end
  end

  def update
     @user = User.find_by(id: params[:id])
      if @user.update_attributes(user_params)
        render json: @user
      else
        render :json=> @user.errors, :status=>422
      end
  end


  def destroy
   @user = User.find_by(id: params[:id])
    if @user.destroy
      render :json=> { success: 'user was successfully deleted' }, :status=>201
    else
      render :json=> { error: 'user could not be deleted' }, :status=>422
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
   


end



