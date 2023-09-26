class UsersController < ApplicationController
  def show
    @user=current_user
    @finduser=User.find(params[:id])
    @spots=@finduser.spots.all
    @favorites=Favorite.where(user_id:@user.id).all
  end

  def edit
    @user=User.find(params[:id])
    if @user!=current_user
      redirect_to user_path(current_user)
    end
  end

  def update
    @user=User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
