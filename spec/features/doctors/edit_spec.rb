require 'rails_helper'
feature 'Doctors', type: :feature do
  describe 'Edit doctors' do

    it 'editing doctor', js: true do
      doctor = Fabricate.create(:doctor)
      visit doctors_path
      new_name = 'Adriele Souza'
      
      click_on 'Editar'
      fill_in 'doctor_name', with: new_name
      click_on 'Atualizar Médico'
      
      expect(page).to have_content(new_name)
      expect(page).to have_text('Médico atualizado com sucesso!')  
    end
  end
end
