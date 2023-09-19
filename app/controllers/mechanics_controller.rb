class MechanicsController < ApplicationController
  def show
    @mechanic = Mechanic.find(params[:id])
    @ride_ids = Ride.where.not(id: @mechanic.rides.ids).ids
  end
end