class Doctor < ApplicationRecord
  validates :name, :crm_number, :crm_uf, presence: true
  validates :crm_number, uniqueness: {scope: :crm_uf}
  has_many :appointments

  def destroy
    raise "Médico não pode ser excluído pois possui consultas agendadas" unless appointments.count == 0
    super
  end
end
