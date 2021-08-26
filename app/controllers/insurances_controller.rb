class InsurancesController < ApplicationController
  def index
    @insurances = Insurance.all
    @user_answers = current_user.questions
    @public_insurances = Insurance.where(private: false)
    @private_insurances = Insurance.where(private: true)
    @employment_status = @user_answers.employment_status
    @annual_gross_income_range = @user_answers.annual_gross_income_range

    if income_range < 62550 || (employment_status == "student" && age < 30)
      @insurance = @public_insurances
      @type = "public health care."
    elsif age <= 35 && income_range > 62550 
      @insurance = @private_insurances
      @type = "private health care as it is cheaper in the long term."
    else
      @insurance = @insurances
      @type = "either public or private health insurance."
    end
  end
end
