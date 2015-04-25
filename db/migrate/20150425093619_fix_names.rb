class FixNames < ActiveRecord::Migration
  def change
    rename_column :professors, :firstname, :first_name
    rename_column :professors, :lastname, :last_name
  end
end
