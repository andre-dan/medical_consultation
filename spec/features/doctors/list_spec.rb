# frozen_string_literal: true

require 'rails_helper'

feature 'Doctors', type: :feature do
  describe 'list of doctors' do
    let!(:doctor) { Fabricate.create(:doctor) }
    before do
      visit(doctors_path)
    end

    it 'index doctor path' do
      expect(page).to have_content('Listagem de Médicos')
    end

    it 'see atribute name' do
      expect(page).to have_content(doctor.name)
    end

    it 'see atribute crm' do
      expect(page).to have_content(doctor.crm)
    end

    it 'see atribute crm_uf' do
      expect(page).to have_content(doctor.crm_uf)
    end

    it 'see links edit and destroy' do
      expect(page).to have_link('Editar').and have_link('Excluir')
    end
  end
end
