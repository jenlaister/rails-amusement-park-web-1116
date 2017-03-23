class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
    current_user
  end

  def show
    find_attraction
    current_user
  end

  def takeride
    find_attraction
    current_user
    @ride = Ride.create(attraction_id: @attraction.id, user_id: @user.id)
    @message = @ride.take_ride
    redirect_to user_path(@user), notice: @message
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def edit
    find_attraction
  end

  def update
    find_attraction
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end



  private

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end

  def find_attraction
    @attraction = Attraction.find(params[:id])
  end

end
