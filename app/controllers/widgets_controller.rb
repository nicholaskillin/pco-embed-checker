class WidgetsController < ApplicationController

  def show
    @widget = Widget.find(params[:id])
  end

  def index
  end

end
