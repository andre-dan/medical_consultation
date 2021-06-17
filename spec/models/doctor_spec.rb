require 'rails_helper'

RSpec.describe Doctor, type: :model do
  it 'is valid with all atributes' do
    doctor = Fabricate.create(:doctor)
    expect(doctor).to be_valid  
  end

  context 'Validations'do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:crm_number) }
    it { is_expected.to validate_presence_of(:crm_uf) }
    it { is_expected.to validate_uniqueness_of(:crm_number).scoped_to(:crm_uf) }
  end
end
