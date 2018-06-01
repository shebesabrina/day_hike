class TrailsController < ApplicationController

  def show
    @trail = Trail.find(params[:id])
  end

  def number_of_trips
    trips.count
  end
end
