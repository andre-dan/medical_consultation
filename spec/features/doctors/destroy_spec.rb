require 'rails_helper'

feature 'Doctors', type: :feature do
  describe 'Delete doctors' do
    before do
      @doctor = Fabricate.create(:doctor)
      visit doctors_path
    end
    
    xit 'delete doctor', js: true do
      find(:xpath, '/html/body/table/tbody/tr/td[5]/a').click
      page.driver.browser.switch_to.alert.accept
      3.second
      expect(page).to have_content('Médico excluído com sucesso!')
    end

    xit 'delete only without appointment' do
      patient = Fabricate.create(:patient)
      appointment = Fabricate.create(:appointment)

      find(:xpath, '/html/body/table/tbody/tr/td[5]/a').click
      page.driver.browser.switch_to.alert.accept
      3.second
      expect(page).to have_content('Médico não pode ser excluído pois possui consultas agendadas')
    end
  end
end
