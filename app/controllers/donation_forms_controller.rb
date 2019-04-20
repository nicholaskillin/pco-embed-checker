class DonationFormsController < ApplicationController
  def index
    @donation_form = DonationForm.new
    @donation_form_index = current_user.user_donation_forms
  end

   def create
    @donation_form = current_user.donation_forms.build(donation_form_params)
    @donation_form_index = current_user.user_donation_forms

     if @donation_form.save
      flash[:success] = "New donation form integration created."
      redirect_to @donation_form
    else
      render :index
    end
  end

   def show
    @donation_form = DonationForm.new
    @donation_form_current = DonationForm.find(params[:id])
    @donation_form_index = current_user.user_donation_forms
  end

   def destroy
    @donation_form_current = DonationForm.find(params[:id])
    @donation_form_current.destroy

     redirect_to donation_forms_path
  end

   private

     def donation_form_params
      params.require(:donation_form).permit(:name, :url)
    end
end
