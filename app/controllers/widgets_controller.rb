class WidgetsController < ApplicationController

  def index
    @widget = Widget.new()
  end
  
  def create
    @widget = current_user.widgets.build(widget_params)
    if @widget.save
      flash[:success] = "New widget created."
      redirect_to root_url
    else
      flash[:danger] = "There was a problem."
      redirect_to root_url
    end
  end

  private
    
    def widget_params
      params.require(:widget).permit(:name, :code)
    end

end
