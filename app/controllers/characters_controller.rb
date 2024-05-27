class CharactersController < ApplicationController
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
