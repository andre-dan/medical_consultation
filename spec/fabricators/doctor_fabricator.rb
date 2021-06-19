Fabricator(:doctor) do
  name Faker::Name.name
  crm_number Faker::Code.npi
  crm_uf 'CE' 
end
