class AddflagToLikes < ActiveRecord::Migration[5.0]
  def change
  	add_column :likes, :flag, :string
  end
end
