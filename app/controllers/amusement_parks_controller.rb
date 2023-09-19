class AmusementParksController < ApplicationController
  def show
    @park = AmusementPark.find(params[:id])
    @mechanics = @park.mechanics.distinct
    @rides = @park.ride_exp
  end
end