class Api::V1::DonationFormsController < ApplicationController
  #protect_from_forgery :except => [:create]

  def index
    @donation_forms = current_user.donation_forms
    render json: @donation_forms
  end

  def create
    @donation_form = current_user.donation_forms.build(donation_form_params)
    if @donation_form.save
      flash[:success] = "New donation form integration created."
      render json: @donation_form
    else
      render json: { :errors => @donation_form.errors.full_messages }
    end
  end

  private

  def donation_form_params
    params.require(:donation_form).permit(:name, :url, :app)
  end
end
