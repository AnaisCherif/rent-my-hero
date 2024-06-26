class ReviewsController < ApplicationController
  before_action :set_character, only: %i[new create]

  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.character = @character
    @review.user = current_user
    @review.save
    if @review.save
      redirect_to character_path(@character)
    else
      @review_modal_open = true
      render 'characters/show', status: :unprocessable_entity
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
