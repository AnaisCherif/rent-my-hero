class CharactersController < ApplicationController

  def new
    @character = Character.new
  end

  def create
    @character = Character.new(character_params)
    @character.save
    redirect_to new_character_path
  before_action :set_character
  before_action :params_character

  def edit
  end

  def update
    @character.update(character_params)
    redirect_to character_path(@character)
  end

  def destroy
    @character.destroy if @character.user == current_user
    redirect_to characters_path
  end

  private

  def character_params
    params.require(:character).permit(:name, :location, :from, :price, :skills, :photo_url, :user_id)

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
