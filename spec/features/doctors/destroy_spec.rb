require 'rails_helper'
feature 'Doctors', type: :feature do
  describe 'Delete doctors' do

    it 'delete doctor', js: true do
      doctor = Fabricate.create(:doctor)
      visit doctors_path
      
      find(:xpath, "/html/body/table/tbody/tr/td[5]/a").click
      page.driver.browser.switch_to.alert.accept
      3.second
      expect(page).to have_content('Médico excluído com sucesso!')  
    end
  end
end
