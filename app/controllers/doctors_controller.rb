# frozen_string_literal: true
# Controller Doctor
class DoctorsController < ApplicationController
  def index
    @doctors = Doctor.all
  end
end
