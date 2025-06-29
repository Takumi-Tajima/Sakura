class RenameAdministratorsToAdmins < ActiveRecord::Migration[8.0]
  def change
    rename_table :administrators, :admins
  end
end
