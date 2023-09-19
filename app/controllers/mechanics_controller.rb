class MechanicsController < ApplicationController
  def show
    # require 'pry'; binding.pry
    @mechanic = Mechanic.find(params[:id])
  end
end