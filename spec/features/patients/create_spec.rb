require 'rails_helper'

feature 'Patients', type: :feature do
  describe 'Register patients' do
    before { visit new_patient_path }

    context 'has a title in form' do
      it { expect(page).to have_content('Novo Paciente') }
    end

    context 'create patient' do
      it 'sucsses' do
        date_now = Date.today
        fill_in 'patient_name', with: 'Ana Lucia Torres'
        fill_in 'patient_birth_date', with: date_now 
        fill_in 'patient_cpf', with: '012.464.444-86'
        click_on 'Adicionar Paciente'

        expect(page).to have_content('Paciente cadastrado com sucesso')
        expect(page).to have_content('Ana Lucia Torres')
        expect(page).to have_content(date_now)
        expect(page).to have_content('012.464.444-86')
      end

      xit 'fail crm uniq' do
        doctor = Fabricate.create(:doctor, crm_number: '222222', crm_uf: 'CE')

        fill_in 'doctor_name', with: 'Andre Torres'
        fill_in 'doctor_crm_number', with: '222222'
        fill_in 'doctor_crm_uf', with: 'CE'
        click_on 'Adicionar Médico'

        expect(page).to have_content('Crm number has already been taken')
      end

      xit 'fail validates atribute' do
        click_on 'Adicionar Médico'

        expect(page).to have_content("Name can't be blank")
        expect(page).to have_content("Crm number can't be blank")
        expect(page).to have_content("Crm uf can't be blank")
      end
    end
  end
end
