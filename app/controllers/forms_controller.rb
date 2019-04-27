class FormsController < ApplicationController
  def index
    @forms = current_user.forms
  end

  def create
    @form = current_user.forms.build(form_params)
    @forms = current_user.forms

    if @form.save
      flash[:success] = "New form integration created."
      redirect_to @form
    else
      render :index
    end
  end

  def show
    @form = current_user.forms.find(params[:id])
    @forms = current_user.forms
  end

  def destroy
    @form = current_user.forms.find(params[:id])
    @form.destroy
  
    redirect_to forms_path
  end

  private
    
    def form_params
      params.require(:form).permit(:name, :url)
    end
end
