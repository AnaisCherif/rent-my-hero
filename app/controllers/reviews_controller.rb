class ReviewsController < ApplicationController
  before_action :set_character, only: %i[new create]
  before_action :set_reviews, only: :show

  def index
    @reviews = Review.all
  end

  def show
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.character = @character
    @review.save
    if @review.save
      redirect_to character_path(@character)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_character
    @character = Character.find(params[:character_id])
  end

  def set_reviews
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content, :reco)
  end
end
