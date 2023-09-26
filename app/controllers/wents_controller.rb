class WentsController < ApplicationController
  def create
    spot = Spot.find(params[:spot_id])
    went = current_user.wents.new(spot_id: spot.id)
    went.save
    redirect_to spots_path
  end

  def destroy
    spot = Spot.find(params[:spot_id])
    went = current_user.wents.find_by(spot_id: spot.id)
    went.destroy
    redirect_to spots_path
  end
end
