require 'rails_helper'

feature 'Doctors', type: :feature do
  describe 'Register doctors' do
    before { visit new_doctor_path }
    
    context "has a title in form" do
      it {expect(page).to have_content("Novo Médico")}
    end
    
    context 'create doctor' do
      it 'sucsses' do  
        fill_in 'doctor_name', with: 'Andre Torres'
        fill_in 'doctor_crm_number', with: '123456'
        fill_in 'doctor_crm_uf', with: 'CE'
        click_on 'Adicionar Médico'

        expect(page).to have_content('Médico cadastrado com sucesso')
        expect(page).to have_content('Andre Torres')
        expect(page).to have_content('123456')
        expect(page).to have_content('CE')
      end

      it 'fail crm uniq' do
        doctor = Fabricate.create(:doctor, crm_number:"222222", crm_uf:"CE")
        
        fill_in 'doctor_name', with: 'Andre Torres'
        fill_in 'doctor_crm_number', with: '222222'
        fill_in 'doctor_crm_uf', with: 'CE'
        click_on 'Adicionar Médico'

        expect(page).to have_content('Crm number has already been taken')
      end  

      it 'fail validates atribute' do
        click_on 'Adicionar Médico'

        expect(page).to have_content("Name can't be blank")
        expect(page).to have_content("Crm number can't be blank")  
        expect(page).to have_content("Crm uf can't be blank")    
      end
    end  
  end
end