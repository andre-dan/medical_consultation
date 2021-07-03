class AppointmentsController < ApplicationController
  before_action :set_appointment, only: %i[edit update]
  before_action :set_doctors_options, :set_patients_options, only: %i[new create edit update]

  def index
    @appointments = Appointment.all
  end
  
  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    return redirect_to appointments_path, notice:'Consulta cadastrada com sucesso' if @appointment.save
    render :new
  end

  def edit
  end

  def update
    return redirect_to appointments_path, notice: 'Consulta atualizado com sucesso!' if @appointment.update(appointment_params)
    render :edit
  end

  private

  def set_doctors_options
    @doctors_options = Doctor.all.pluck(:name, :id)
  end

  def set_patients_options
    @patients_options = Patient.all.pluck(:name, :id)
  end

  def appointment_params
    params.require(:appointment).permit(:starts_at, :ends_at, :doctor_id, :patient_id)
  end

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end
end
