# frozen_string_literal: true

require 'rails_helper'

feature 'Doctors', type: :feature do
  describe 'list of doctors' do
    let!(:doctor) { Fabricate.create(:doctor) }
    before do
      visit(doctors_path)
    end
    
    context 'index doctor path' do
      it { expect(page).to have_content('Listagem de Médicos') }
    end

    context 'see atribute name' do
      it { expect(page).to have_content(doctor.name) }
    end

    context 'see atribute crm' do
      it { expect(page).to have_content(doctor.crm) }
    end

    context 'see atribute crm_uf' do
      it { expect(page).to have_content(doctor.crm_uf) }
    end

    context 'see links edit and destroy' do
      it { expect(page).to have_link('Editar').and have_link('Excluir') }
    end
  end
end
