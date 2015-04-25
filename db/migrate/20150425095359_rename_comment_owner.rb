class RenameCommentOwner < ActiveRecord::Migration
  def change
    rename_column :comments, :commentable_id, :owner_id
    rename_column :comments, :commentable_type, :owner_type
  end
end
