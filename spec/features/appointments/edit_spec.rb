require 'rails_helper'
feature 'Appointments', type: :feature do
  describe 'Edit appointments' do
    it 'editing appointment', js: true do
      appointment = Fabricate.create(:appointment)
      visit appointments_path
      new_datetime = DateTime.now.strftime('%I:%M:%S %p')
      
      click_on 'Editar'
      fill_in 'appointment_starts_at', with: new_datetime
      click_on 'Atualizar Consulta'
      
      expect(page).to have_content(new_datetime)
      expect(page).to have_text('Consulta atualizada com sucesso!')
    end
  end
end
