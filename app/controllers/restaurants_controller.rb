class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  # As a user, I can view the details of a restaurant
  def show
    @restaurant = Restaurant.find(params[:id])
  end

  # As a user, I can add a new restaurant
  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save
    redirect_to restaurant_path(@restaurant)
  end

  # # As a user, I can edit a task (mark as completed / update title & details)
  # def edit
  #   @task = Task.find(params[:id])
  # end

  # def update
  #   @task.update(task_params)
  #   redirect_to task_path(@task)
  # end

  # # As a user, I can remove a task
  # def destroy
  #   @task.destroy
  #   redirect_to tasks_path
  # end

  # private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category)
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
