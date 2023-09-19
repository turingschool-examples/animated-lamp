class RideMechanicsController < ApplicationController
  def create
    @mechanic = Mechanic.find(params[:id])
    if params[:ride_id] != nil
      RideMechanic.create!(ride_id: params[:ride_id], mechanic_id: params[:id])
    end
    redirect_to "/mechanics/#{params[:id]}"
  end
end