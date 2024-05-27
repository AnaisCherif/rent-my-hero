class CharactersController < ApplicationController

  def new
    @character = Character.new
  end

  def create
    @character = Character.new(character_params)
    @character.save
    redirect_to new_character_path
  end

  private

  def character_params
    params.require(:character).permit(:name, :location, :from, :price, :skills, :photo_url, :user_id)
  end
end
