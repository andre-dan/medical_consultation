class Doctor < ApplicationRecord
  validates :name, :crm_number, :crm_uf, presence: true

    def crm
      "#{self.crm_number}#{self.crm_uf}"
    end
end
