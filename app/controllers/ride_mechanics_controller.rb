class RideMechanicsController < ApplicationController
  def create
    ride_mechanic = RideMechanic.new(ride_id: params[:ride_id], mechanic_id: params[:id])

    if ride_mechanic.save == false
      flash[:error] = "Could not add the ride specified."
    else
      flash[:success] = "Ride added successfully."
    end

    redirect_to "/mechanics/#{params[:id]}"
  end
end