class Like < ApplicationRecord
  belongs_to :post, foreign_key: :post_id
  belongs_to :user, foreign_key: :author_id

  def likes_counter
    post.increment :likes_counter
    post.save
  end
end
