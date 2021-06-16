require 'rails_helper'

feature 'Doctors', type: :feature do
  describe 'Register doctors' do
    before { visit new_doctor_path }
    
    context "has a title in form" do
      it {expect(page).to have_content("Novo Médico")}
    end
    
    it 'create doctor' do

      fill_in 'doctor_name', with: 'Andre Torres'
      fill_in 'doctor_crm', with: '123456'
      fill_in 'doctor_crm_uf', with: 'CE'
      click_on 'Adicionar Médico'

      expect(page).to have_content('Médico cadastrado com sucesso')
      expect(page).to have_content('Andre Torres')
      expect(page).to have_content('123456')
      expect(page).to have_content('CE')
    end
  end
end