class ProfilesController < ApplicationController

  def show
    @user = User.find_by(user_name: params[:user_name])
    @posts = User.find_by(user_name: params[:user_name]).posts.order('created_at DESC')
  end

  def edit
    @user = User.find_by(user_name: params[:user_name])
  end

  def update
    @user = User.find_by(user_name: params[:user_name])
    # @avatar = User.find_by(user_name: params[:user_name]).avatar
    if @avatar.update(profile_params)
      flash[:success] = "Updated successfully!"
      redirect_to profiles_path(@user.user_name)
    else
      @user.errors.full_messages
      flash[:error] = @user.errors.full_messages
      render :edit
    end
  end

  private

  def profile_params
    params.require(:user).permit(:avatar, :bio)
  end
end
