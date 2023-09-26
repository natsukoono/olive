class SpotsController < ApplicationController
  def show
    @user=current_user
    @spot=Spot.find(params[:id])
    @finduser=@spot.user
    @comment=Comment.new
  end

  def index
    @user=current_user
    @spots=Spot.all
  end

  def edit
    @user=current_user
    @spot=Spot.find(params[:id])
    redirect_to spots_path unless current_user.id==@spot.user_id
  end

  def new
    @user=current_user
    @spot=Spot.new
  end

  def create
    @spot=Spot.new(spot_params)
    @spot.user_id=current_user.id
    @spot.save
    redirect_to spots_path
  end

  def destroy
    @spot=Spot.find(params[:id])
    @spot.destroy
    redirect_to spots_path
  end

  def update
    @spot=Spot.find(params[:id])
    @spot.update(spot_params)
    redirect_to spot_path(@spot.id)
  end

  private

  def spot_params
    params.require(:spot).permit(:title, :body, :place, :image)
  end
end