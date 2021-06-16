require 'rails_helper'

feature 'Doctors', type: :feature do
  describe 'Register doctors' do
    before { visit new_doctor_path }
    
    context "has a title in form" do
      it {expect(page).to have_content("Novo Médico")}
    end
    
    it 'create doctor' do

      fill_in 'doctor_name', with: 'Andre Torres'
      fill_in 'doctor_crm_number', with: '123456'
      fill_in 'doctor_crm_uf', with: 'CE'
      click_on 'Adicionar Médico'

      expect(page).to have_content('Médico cadastrado com sucesso')
      expect(page).to have_content('Andre Torres')
      expect(page).to have_content('123456')
      expect(page).to have_content('CE')
    end

    it 'is valid with all atributes' do
      doctor = Fabricate.create(:doctor)

      expect(doctor).to be_valid  
    end

    it 'is invalid without name' do
      doctor = Fabricate.build(:doctor, name: nil)

      doctor.valid?
      expect(doctor.errors[:name]).to include("can't be blank")  
    end

    it 'is invalid without crm_number' do
      doctor = Fabricate.build(:doctor, crm_number: nil)

      doctor.valid?
      expect(doctor.errors[:crm_number]).to include("can't be blank")  
    end

    it 'is invalid without crm_uf' do
      doctor = Fabricate.build(:doctor, crm_uf: nil)

      doctor.valid?
      expect(doctor.errors[:crm_uf]).to include("can't be blank")  
    end

    it 'method return a crm ' do
      doctor = Fabricate.create(:doctor)

      expect(doctor.crm).to eq("#{doctor.crm_number}#{doctor.crm_uf}")  
    end
  end
end