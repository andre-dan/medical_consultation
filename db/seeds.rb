# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Doctor.create!(
  name: 'Andre Torres',
  crm_number: '123456',
  crm_uf: 'CE'  
)
Doctor.create!(
    name: 'Adriel Lucas',
    crm_number: '123456',
    crm_uf: 'SP'  
  )