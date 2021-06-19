# frozen_string_literal: true

class CreateDoctors < ActiveRecord::Migration[6.1]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :crm
      t.string :crm_uf
      t.references :appointment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
