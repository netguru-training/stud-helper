class AddSubjectRefToSubjectItems < ActiveRecord::Migration
  def change
    add_reference :subject_items, :subject, index: true
  end
end
