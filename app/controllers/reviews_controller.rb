class ReviewsController < ApplicationController
  before_action :set_restaurant, only: [:new, :create]
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant #genera directamente
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render "restaurants/show"
    end
  end

  private

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(@review.restaurant)
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  #def set_restaurant
    #@restaurant = Restaurant.find(params[:restaurant_id])
  #end

  #sum( )
  #Select * from sum(parámetro) / count (parámetro)
  #select avg(rating) from reviews
  #where restaurant_id = " 1 ";


end
