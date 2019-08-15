class IntegrationsController < ApplicationController
  def index
    @integrations = current_user.integrations
  end

  def show
    @integration = current_user.integrations.find(params[:id])
    @integrations = current_user.integrations
  end

  def destroy
    @integration = current_user.integrations.find(params[:id])
    @integration.destroy

     redirect_to integrations_path
  end
end
