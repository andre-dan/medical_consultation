class PatientsController < ApplicationController
  before_action :set_patient, only: %i[edit update destroy]

  def index
    @patients = Patient.all
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    return redirect_to patients_path, notice: 'Paciente cadastrado com sucesso' if @patient.save
    render :new
  end

  def edit
  end

  def update
    return redirect_to patients_path, notice: 'Paciente atualizado com sucesso!' if @patient.update(patient_params)
    render :edit
  end

  private

  def patient_params
    params.require(:patient).permit(:name, :birth_date, :cpf)
  end

  def set_patient
    @patient = Patient.find(params[:id])
  end
end
