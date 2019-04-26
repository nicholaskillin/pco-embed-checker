class WidgetsController < ApplicationController

  def index
    @widgets = current_user.widgets
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
    @widget_current = current_user.widgets.find(params[:id])
    @widgets = current_user.widgets
  end

  def destroy
    @widget_current = current_user.widgets.find(params[:id])
    @widget_current.destroy
  
    redirect_to widgets_path
  end

  private
    
    def widget_params
      params.require(:widget).permit(:name, :code)
    end

end
