Fabricator(:appointment) do
    starts_at Faker::Date.forward(days: 23)
    ends_at Faker::Date.forward(days: 23)
    patient
    doctor
end
