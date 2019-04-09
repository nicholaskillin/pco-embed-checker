class WidgetsController < ApplicationController

  def index
    @widget = Widget.new
  end
  
  def create
    @widget = current_user.widgets.build(widget_params)
    if @widget.save
      flash[:success] = "New widget created."
      redirect_to root_url
    else
      render :index
    end
  end

  private
    
    def widget_params
      params.require(:widget).permit(:name, :code)
    end

end
