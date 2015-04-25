class AddItemToSubjectItems < ActiveRecord::Migration
  def change
    add_column :subject_items, :item, :string
  end
end
