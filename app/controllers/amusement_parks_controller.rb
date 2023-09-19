class AmusementParksController < ApplicationController
  def show
    @ap = AmusementPark.find(params[:id])
    @mechanics = @ap.mechanics
  end
end