require 'rails_helper'
feature 'Patients', type: :feature do
  describe 'Edit Patient' do

    it 'editing patient', js: true do
      patient = Fabricate.create(:patient)
      visit patients_path
      new_name = 'Andreza Maria'
      
      click_on 'Editar'
      fill_in 'patient_name', with: new_name
      click_on 'Atualizar Paciente'
      
      expect(page).to have_content(new_name)
      expect(page).to have_text('Paciente atualizado com sucesso!')  
    end
  end
end
