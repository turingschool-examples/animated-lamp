class RideMechanicsController < ApplicationController
  def create
    RideMechanic.create!(ride_mechanic_params)
    redirect_to mechanic_path(params[:ride_mechanic][:mechanic_id])
  end

  private
  def ride_mechanic_params
    params.require(:ride_mechanic).permit(:ride_id, :mechanic_id)
  end
end