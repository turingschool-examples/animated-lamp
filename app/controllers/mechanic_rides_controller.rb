class MechanicRidesController < ApplicationController
    def create
        @mechanic = Mechanic.find(params[:mechanic_id])
        if params[:ride_id] != nil
            MechanicRide.create!(mechanic_id: params[:mechanic_id], ride_id: params[:ride_id])
        end

        redirect_to "/mechanics/#{params[:mechanic_id]}"
    end
end