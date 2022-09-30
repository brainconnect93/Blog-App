class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  after_save :updates_posts_counter

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def updates_posts_counter
    user.increment!(:PostsCounter)
  end

  def recent_comments
    comments.order(created_at: :desc).last(5)
  end
end
