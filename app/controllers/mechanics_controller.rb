class MechanicsController < ApplicationController
  def show
    @mechanic = Mechanic.find(params[:id])
  end

  def add_ride
    mechanic = Mechanic.find(params[:id])
    ride = Ride.find(params[:ride_id])
    mechanic.rides << ride
  
    redirect_to "/mechanics/#{mechanic.id}"
  end
end