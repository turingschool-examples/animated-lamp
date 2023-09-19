# app/controllers/amusement_parks_controller.rb
class AmusementParksController < ApplicationController
  def show
    @amusement_park = AmusementPark.find(params[:id])
  end
end
