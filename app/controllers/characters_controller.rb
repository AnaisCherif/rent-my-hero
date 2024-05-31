class CharactersController < ApplicationController
  before_action :set_character, only: [:show, :destroy, :edit, :update]

  def index
    @characters = Character.with_attached_photo.includes(:reviews).all
    @reviews = Review.where(reco: true, id: Review.pluck(:id).sample(2))

    if params[:query].present?
      sql_subquery = "name ILIKE :query OR univers ILIKE :query"
      @characters = @characters.where(sql_subquery, query: "%#{params[:query]}%")
    end

    sort_order = params[:desc] ? :desc : params[:asc] ? :asc : nil
    @characters.order(price: sort_order) if sort_order

    @markers = @characters.geocoded.map do |character|
      {
        lat: character.latitude,
        lng: character.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { character: character })
      }
    end

    if params[:r_asc].present?
      @characters = @characters.sort_by(&:rating)
      # @characters = @characters.sort_by { |character| character.rating }
    elsif params[:r_desc].present?
      @characters = @characters.sort_by(&:rating).reverse
    end

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
