Fabricator(:patient) do
  name Faker::Name.name
  birth_date Faker::Date.birthday(min_age: 18, max_age: 65)
  cpf CPF.generate
end
