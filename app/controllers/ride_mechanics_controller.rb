class RideMechanicsController < ApplicationController
  def create
    @mechanic = Mechanic.find(params[:id])
    RideMechanic.create(ride_id: (params[:new_ride_id]), mechanic_id: @mechanic.id)
    redirect_to "/mechanics/#{@mechanic.id}"
  end
end