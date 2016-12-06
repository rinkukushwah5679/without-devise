class AddColumnToLikes < ActiveRecord::Migration[5.0]
  def change
    add_column :likes, :comment_id, :integer
    add_column :likes, :user_id, :integer
  end
end
