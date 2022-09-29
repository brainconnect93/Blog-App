class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes

  def recent_posts
    posts.order(created_at: :desc).last(3)
  end
end
