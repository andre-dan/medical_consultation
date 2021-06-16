class Doctor < ApplicationRecord
    def crm
      "#{self.crm_number}#{self.crm_uf}"
    end
end
