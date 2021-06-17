class RenameDoctorsToCrmInCrmNumbers < ActiveRecord::Migration[6.1]
  def up
    rename_column :doctors, :crm, :crm_number
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end

  def down 
    rename_column :doctors, :crm_number, :crm
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
