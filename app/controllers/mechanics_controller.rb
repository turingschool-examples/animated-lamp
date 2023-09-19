class MechanicsController < ApplicationController

  def show
    @mechanics = Mechanic.find(params[:id])
  end
end
