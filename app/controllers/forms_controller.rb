class FormsController < ApplicationController
  def index
    @form = Form.new
    @form_index = current_user.user_forms
  end

  def create
    @form = current_user.forms.build(form_params)
    if @form.save
      flash[:success] = "New form integration created."
      redirect_to @form
    else
      render :index
    end
  end

  def show
    @form = Form.new
    @form_current = Form.find(params[:id])
    @form_index = current_user.user_forms
  end

  def destroy
    @form_current = Form.find(params[:id])
    @form_current.destroy
  
    redirect_to forms_path
  end

  private
    
    def form_params
      params.require(:form).permit(:name, :code)
    end
end
