class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :posts, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id

  after_initialize :init

  validates :name, presence: true, length: { maximum: 50 }
  validates :postscounter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }

  def admin?
    role == 'admin'
  end

  def most_recent_posts
    posts.order(created_at: :desc).limit(5)
  end

  def init
    return unless postscounter.nil?

    self.postscounter = 0
  end
end
