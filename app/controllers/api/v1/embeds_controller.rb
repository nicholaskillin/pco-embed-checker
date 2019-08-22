class Api::V1::EmbedsController < ApplicationController

  def create
    @embed= current_user.embeds.build(embed_params)
    if @embed.save
      flash[:success] = "Embed succesfully created."
      render json: @embed
    else
      render json: { :errors => @embed.errors.full_messages }
    end
  end

  private

  def embed_params
    params.require(:embed).permit(:name, :data, :app)
  end
end
