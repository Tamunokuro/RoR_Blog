class AddPostIdToLikes < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :post, index: true, foreign_key: {to_table: :posts}
  end
end
