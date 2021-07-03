# frozen_string_literal: true

require 'rails_helper'

feature 'Appointments', type: :feature do
  describe 'list of appointments' do
    let!(:appointment) { Fabricate.create(:appointment) }
    before do
      visit(appointments_path)
    end
    
    context 'index appointment' do
      it { expect(page).to have_content('Listagem de Consultas') }
    end

    context 'see atribute starts_at' do
      it { expect(page).to have_content(appointment.starts_at.strftime('%I:%M:%S %p')) }
    end

    context 'see atribute ends_at' do
      it { expect(page).to have_content(appointment.ends_at.strftime('%I:%M:%S %p')) }
    end

    context 'see atribute patient' do
      it { expect(page).to have_content(appointment.patient.name) }
    end

    context 'see atribute doctor' do
      it { expect(page).to have_content(appointment.doctor.name) }
    end

    context 'see links edit and destroy' do
      it { expect(page).to have_link('Editar').and have_link('Excluir') }
    end
  end
end
