class WidgetsController < ApplicationController

  def index
    @widget = Widget.new
    @widget_index = current_user.user_widgets
  end
  
  def create
    @widget = current_user.widgets.build(widget_params)
    if @widget.save
      flash[:success] = "New widget created."
      redirect_to @widget
    else
      render :index
    end
  end

  def show
    @widget = Widget.new
    @widget_current = Widget.find(params[:id])
    @widget_index = current_user.user_widgets
  end

  private
    
    def widget_params
      params.require(:widget).permit(:name, :code)
    end

end
