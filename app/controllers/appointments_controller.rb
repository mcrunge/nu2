class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.all
    @registration_offices = RegistrationOffice.all
  end

  def update
    @appointment = Appointment.find(params[:id])
    @appointment.update(user: current_user)
    redirect_to registration_office_path(@appointment.registration_office)
  end
end
