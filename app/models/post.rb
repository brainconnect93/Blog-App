class Post < ApplicationRecord
    belongs_to :user
    has_many :comments
    has_many :likes

    def updates_posts_counter
        posts.increment!(:PostsCounter)
    end

    def recent_comments
        comments.order(created_at: :desc).last(5)
    end
end