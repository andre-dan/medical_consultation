class Doctor < ApplicationRecord
  validates :name, :crm_number, :crm_uf, presence: true
  validates :crm_number, uniqueness: {scope: :crm_uf}
end
