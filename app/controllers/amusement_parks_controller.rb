class AmusementParksController < ApplicationController

  def show
    @parks = AmusementPark.find(params[:id])
  end
end