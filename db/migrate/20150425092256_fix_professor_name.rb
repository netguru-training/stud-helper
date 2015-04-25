class FixProfessorName < ActiveRecord::Migration
  def change
  	def self.up
      rename_column :professors, :firstname, :first_name
      rename_column :professors, :lastname, :lasn_name
    end

    def self.down
      rename_column :professors, :first_name, :firstname
      rename_column :professors, :lasn_name, :lastname
    end
  end
end
