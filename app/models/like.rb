class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_save :update_comments_counter

  def update_comments_counter
    post.increment!(:likes_counter)
  end
end
