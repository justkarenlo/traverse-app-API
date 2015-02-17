class TripsController < ApplicationController

  def index
    user = @current_user
    trips = Trip.where(user_id: user.id)
    return render json: trips
  end

  def create
    user = @current_user
    trip = user.trips.create(title: params[:title])

    return render json: trip
  end

  def update
    trip = Trip.find(params[:id])
    trip.update(trips_params)

    return render json: trip
  end

  def destroy
    trip = Trip.find_by(id: params[:id])
    trip.destroy

    return render json: trip
  end

  private
    def trips_params
      params.require(:trip).permit(:title)
    end

end

