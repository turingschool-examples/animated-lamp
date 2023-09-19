class MechanicsRideController < ApplicationController
  def create
    @mechanic = Mechanic.find(params[:mechanic_id])
    @ride = Ride.find_by(id: params[:mechanic][:ride_id])

    if @ride.nil?
      flash[:notice] = "Ride not found."
    else
      @mechanic.rides << @ride
      flash[:notice] = "#{@ride.name} has been added to #{@mechanic.name}'s workload."
    end

    redirect_to mechanic_path(@mechanic)
  end
end