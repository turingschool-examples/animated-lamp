class AmusementParksController < ApplicationController

  def show
    @parks = AmusementPark.find(params[:id])

    @mechanics_on_site = @parks.rides
      .joins(:mechanics).distinct
    # require 'pry';binding.pry
  end
end