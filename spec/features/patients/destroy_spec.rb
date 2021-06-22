require 'rails_helper'

feature 'Patients', type: :feature do
  describe 'Delete patient' do
    before do
      @patient = Fabricate.create(:patient)
      visit patients_path
    end
    
    it 'delete patient', js: true do
      click_on 'Excluir'
      page.driver.browser.switch_to.alert.accept
      3.second
      expect(page).to have_content('Paciente excluído com sucesso!')
    end
  end
end
