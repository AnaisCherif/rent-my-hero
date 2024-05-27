class CharactersController < ApplicationController
  before_action :set_character, only: [:show, :destroy, :edit, :update]
  before_action :set_user, only: [:create]
  before_action :params_character
  
  def index
    @characters = Character.all
  end

  def new
    @character = Character.new
  end
  
  def show
  end

  def create
    @character = Character.new(params_character)
    if @character.save
    redirect_to character_path(@character)
    else 
      render :new, status: :unprocessable_entity
    end 
  end 

  def edit
  end

  def update
    @character.update(params_character)
    redirect_to character_path(@character)
  end

  def destroy
    @character.destroy if @character.user == current_user
    redirect_to characters_path, status: :see_other
  end

  private

  def set_character
    @character = Character.find(params[:id])
  end

  def set_user
    @user = User.find(params[:User_id])
  end

  def params_character
    params.require(:character).permit(:name, :location, :from, :price, :skills, :photo_url)
  end
end
