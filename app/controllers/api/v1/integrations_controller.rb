class Api::V1::IntegrationsController < ApplicationController

  def create
    @integration = current_user.integrations.build(integration_params)
    if @integration.save
      flash[:success] = "Embed succesfully created."
      render json: @integration
    else
      render json: { :errors => @integration.errors.full_messages }
    end
  end

  private

  def integration_params
    params.require(:integration).permit(:name, :data, :app)
  end
end
