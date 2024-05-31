class CharactersController < ApplicationController
  before_action :set_character, only: [:show, :destroy, :edit, :update]

  def index
    @characters = Character.all
    @reviews = Review.all
    @markers = @characters.geocoded.map do |character|
      {
        lat: character.latitude,
        lng: character.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { character: character })
      }
    end

    if params[:query].present?
      sql_subquery = "name ILIKE :query OR univers ILIKE :query"
      @characters = @characters.where(sql_subquery, query: "%#{params[:query]}%")
    end

    if params[:desc].present?
      @characters = @characters.sort_by { |character| -character.price }
    elsif params[:asc].present?
      @characters = @characters.sort_by { |character| character.price }
    end

    if params[:r_asc].present?
      @characters = @characters.sort_by { |character| character.reviews.reco }
    elsif params[:r_desc].present?
      @characters = @characters.sort_by { |character| -character.reviews.reco }
    end

    # if params[:r_asc].present?
    #   @characters = @characters.sort_by { |character| character.reviews.reco }
    # elsif params[:r_desc].present?
    #   @characters = @characters.sort_by { |character| -character.reviews.reco }
    # end
    # array_reco = []
    # @compteur = 0
    # @characters.each do |character|
    #   character.reviews.each do |review|
    #     if review.reco == true
    #       @compteur += 1
    #     else
    #       @compteur -= 1
    #     end
    #   end
    #   array_reco << {character: character, note: @compteur}
    # end
    # raise
  end


  def new
    @character = Character.new
  end

  def show
    @review = Review.new
  end

  def create
    @character = Character.new(params_character)
    @character.user = current_user
    if @character.save
      redirect_to character_path(@character)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @character.update(params_character) if @character.user == current_user
    redirect_to character_path(@character)
  end

  def destroy
    @character.destroy if @character.user == current_user
    redirect_to characters_path, status: :see_other
  end

  def mychars
    @characters = Character.where(user: current_user)
  end

  private

  def set_character
    @character = Character.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def params_character
    params.require(:character).permit(:name, :location, :univers, :price, :skills, :photo)
  end
end
