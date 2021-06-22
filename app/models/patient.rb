class Patient < ApplicationRecord
  validates :name, :birth_date, :cpf, presence: true
  validates :cpf, length: { is: 11, message: 'São 11 números, tente novamente'}, on: %i[create update]
  validates :cpf, uniqueness: true
  has_many :appointments
end
