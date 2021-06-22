require 'rails_helper'
require 'cpf_cnpj'

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
        fill_in 'patient_cpf', with: '01246444486'
        click_on 'Adicionar Paciente'

        expect(page).to have_content('Paciente cadastrado com sucesso')
        expect(page).to have_content('Ana Lucia Torres')
        expect(page).to have_content(date_now)
        expect(page).to have_content('01246444486')
      end

      it 'fail validates atribute' do
        click_on 'Adicionar Paciente'

        expect(page).to have_content("Name can't be blank")
        expect(page).to have_content("Birth date can't be blank")
        expect(page).to have_content("Cpf can't be blank")
      end

      it 'fail cpf uniq' do
        cpf = CPF.generate
        paciente = Fabricate.create(:patient, cpf: cpf)

        fill_in 'patient_name', with: 'Andre Torres'
        #TODO formatar o atributo birth_date
        fill_in 'patient_birth_date', with: Date.today
        fill_in 'patient_cpf', with: cpf
        click_on 'Adicionar Paciente'

        expect(page).to have_content("Cpf has already been taken")
      end

      #CPF Validations
      it 'fail if cpf is invalid' do
        paciente = Fabricate.create(:patient, cpf: '0121251222')

        click_on 'Adicionar Paciente'
        CPF.valid?(paciente.cpf)

        expect(page).to have_content('Cpf São 11 números, tente novamente')
      end
    end
  end
end
