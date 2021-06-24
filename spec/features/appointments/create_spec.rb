require 'rails_helper'

feature 'Appointments', type: :feature do
  describe 'Register appointment' do
    before { visit new_appointment_path }

    context 'has a title in form' do
      it { expect(page).to have_content('Nova Consulta') }
    end

    context 'create appointment' do
      it 'sucsses' do
        fill_in 'appointment_starts_at', with: DateTime.now.strftime('%I:%M:%S %p')
        fill_in 'appointment_ends_at', with: DateTime.now.strftime('%I:%M:%S %p')
        click_on 'Criar Consulta'
 
        expect(page).to have_content('Consulta cadastrada com sucesso')
        expect(page).to have_content(Appointment.last.doctor.name)
        expect(page).to have_content(Appointment.last.patient.name)
      end
    end
  end
end
