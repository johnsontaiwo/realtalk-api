# module api::v1

# class UsersController < ApplicationController

#   def index 
#     @users = User.all
#     render json: @users
#   end

#   def show
#     @user = User.find_by(id: params[:id])
#     render json: @user
#   end

# def create
#     @user = User.create(user_params)
#     if @user.save
#       render json: @user
#     else
#       render json: { error: 'signup error' }, status: :unprocessable_entity
#     end
#   end

#    def update
#      @user = User.find_by(id: params[:id])
#     if @user.update_attributes(user_params)
#       render json: @user
#     else
#       render :json=> @user.errors, :status=>422
#     end
#   end

#   def destroy
#      @user = User.find_by(id: params[:id])
#     if @user.destroy
#       render :json=> { success: 'user was successfully deleted' }, :status=>201
#     else
#       render :json=> { error: 'user could not be deleted' }, :status=>422
#     end
#   end

#   private

#   def user_params
#     params.require(:user).permit(:email, :password, :name)
#   end
# end
# end
