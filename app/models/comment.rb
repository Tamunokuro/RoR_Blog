class Comment < ApplicationRecord
  belongs_to :post, foreign_key: :post_id
  belongs_to :user, foreign_key: :author_id

  after_save :increment_comments_counter

  validates :text, length: { maximum: 1000 }, presence: true

  def increment_comments_counter
    return unless post

    post.increment :comments_counter
    post.save
  end

  def decrement_comments_counter
    return unless post

    post.decrement :comments_counter
    post.save
  end
end
