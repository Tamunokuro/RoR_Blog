class Post < ApplicationRecord
  belongs_to :user, foreign_key: :author_id
  has_many :comments, foreign_key: :post_id
  has_many :likes, foreign_key: :post_id
  after_save :posts_counter

  validates :title, length: { maximum: 250 }, allow_blank: false
  validates :comments_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }

  def recent_comments
    comments.includes(:user).order(created_at: :desc).limit(5)
  end

  def increment_like
    return unless user

    increment :likes_counter
    save
  end

  def posts_counter
    return unless user

    user.increment :postscounter
    user.save
  end
end
