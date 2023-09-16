class MechanicsController < ApplicationController
  def show
    @mechanic = Mechanic.find(params[:mechanic_id])
  end
end