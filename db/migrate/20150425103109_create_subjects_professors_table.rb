class CreateSubjectsProfessorsTable < ActiveRecord::Migration
  def change
    create_table :professors_subjects do |t|
      t.references :subject, index: true
      t.references :professor, index: true
    end
  end
end
