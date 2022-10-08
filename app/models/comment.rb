class Comment < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  belongs_to :post, foreign_key: 'post_id'

  after_save :update_comments_counter

  validate :text, presence: true, length: { maximum: 250 }

  def update_comments_counter
    post.increment!(:comments_counter)
  end

  private :update_comments_counter
end
