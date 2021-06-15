# frozen_string_literal: true
# Controller Doctor
class DoctorsController < ApplicationController
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

  private

  def doctor_params
    params.require(:doctor).permit(:name, :crm, :crm_uf)
  end
end
