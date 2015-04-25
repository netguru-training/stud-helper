class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :name
      t.string :short_name
      t.text :description

      t.timestamps
    end
  end
end
