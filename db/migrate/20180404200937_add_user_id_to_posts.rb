class AddUserIdToPosts < ActiveRecord::Migration[5.1]
  def self.up
    # adding column to posts table, column is user_id, and will be an integer
    add_column :posts, :user_id, :integer
      end
  end
end
