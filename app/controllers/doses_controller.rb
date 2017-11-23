class DosesController < ApplicationController
  before_action :set_dose, only: [:show, :edit, :update, :destroy]

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    @dose.ingredient = Ingredient.find(dose_params[:ingredient_id])
    @dose.description = dose_params[:description]
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose.destroy
    redirect_to dose_path
  end

  private

   def set_dose
      @dose = Dose.find(params[:id])
   end

    def dose_params
      params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
    end
end

# class ReviewsController < ApplicationController
#   before_action :set_restaurant, only: [:create, :new]
#   def new
#     @restaurant = Restaurant.find(params[:restaurant_id])
#     @review = Review.new
#   end

#   def create
#     @review = @restaurant.reviews.new(review_params)
#     # we need `restaurant_id` to asssociate review with corresponding restaurant
#     if @review.save
#       redirect_to restaurant_path(@restaurant)
#     else
#       render :new
#     end
#   end

#   private

#   def review_params
#     params.require(:review).permit(:content, :rating)
#   end

#   def set_restaurant
#     @restaurant = Restaurant.find(params[:restaurant_id])
#   end
# end
