class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id

  validates :name, presence: true, length: { maximum: 50 }
  validates :postscounter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }

  def most_recent_posts
    posts.order(created_at: :desc).limit(5)
  end

  def init
    return unless postscounter.nil?

    self.postscounter = 0
  end
end
