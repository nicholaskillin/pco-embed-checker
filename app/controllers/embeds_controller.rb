class EmbedsController < ApplicationController
  def index
    @embeds = current_user.embeds.order(created_at: :desc)
  end

  def show
    @embed = current_user.embeds.find(params[:id])
    @embeds = current_user.embeds
  end

  def destroy
    @embed = current_user.embeds.find(params[:id])
    @embed.destroy

     redirect_to embeds_path
  end
end
