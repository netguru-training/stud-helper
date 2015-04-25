class CreateSubjectItems < ActiveRecord::Migration
  def change
    create_table :subject_items do |t|
      t.string :description

      t.timestamps
    end
  end
end
