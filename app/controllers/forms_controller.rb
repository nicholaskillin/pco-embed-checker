class FormsController < ApplicationController
  def index
    @form_index = current_user.forms
  end

  def create
    @form = current_user.forms.build(form_params)
    @form_index = current_user.forms

    if @form.save
      flash[:success] = "New form integration created."
      redirect_to @form
    else
      render :index
    end
  end

  def show
    @form_current = current_user.forms.find(params[:id])
    @form_index = current_user.forms
  end

  def destroy
    @form_current = current_user.forms.find(params[:id])
    @form_current.destroy
  
    redirect_to forms_path
  end

  private
    
    def form_params
      params.require(:form).permit(:name, :url)
    end
end
