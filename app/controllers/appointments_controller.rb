class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @appointments = Appointment.all
  end
end