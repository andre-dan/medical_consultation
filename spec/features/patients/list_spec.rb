require 'rails_helper'

feature 'Patients', type: :feature do
  describe 'list of patients' do
    let!(:patient) { Fabricate.create(:patient) }
    before do
      visit(patients_path)
    end

    context 'index patient path' do
      it { expect(page).to have_content('Listagem de Pacientes') }
    end

    context 'see atribute name' do
      it { expect(page).to have_content(patient.name) }
    end

    context 'see atribute birth_date' do
      it { expect(page).to have_content(patient.birth_date) }
    end

    context 'see atribute cpf' do
      it { expect(page).to have_content(patient.cpf) }
    end

    context 'see links edit and destroy' do
      it { expect(page).to have_link('Editar').and have_link('Excluir') }
    end
  end
end
