class DoctorsController < ApplicationController
  before_action :set_doctor, only: %i[edit update destroy]
  
  def index
    @doctors = Doctor.all
  end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(doctor_params)
    return redirect_to doctors_path, notice:'Médico cadastrado com sucesso' if @doctor.save
    render :new
  end

  def edit
  end

  def update
    return redirect_to doctors_path, notice: 'Médico atualizado com sucesso!' if @doctor.update(doctor_params)
    render :edit
  end

  def destroy
    return redirect_to doctors_path, notice: 'Médico excluído com sucesso!' if @doctor.destroy
    render :index
  end

  private

  def doctor_params
    params.require(:doctor).permit(:name, :crm_number, :crm_uf)
  end

  def set_doctor
    @doctor = Doctor.find(params[:id])
  end
end
