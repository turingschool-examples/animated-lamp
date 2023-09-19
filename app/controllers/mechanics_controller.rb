class MechanicsController < ApplicationController
  
  def show
    @mechanic = Mechanic.find(params[:id])
  end

  def update
    @mechanic = Mechanic.find(params[:id])
    require 'pry';binding.pry
  end
end