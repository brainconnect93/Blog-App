require 'rails_helper'

RSpec.describe Like, type: :model do
  before(:all) do
    @user = User.create(
      Name: 'Afolabi',
      Photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      Bio: 'I am a graphic designer',
      PostsCounter: 0
    )
    @post = Post.create(
      title: 'Harry Potter',
      text: 'the sorcerers stone',
      user_id: @user.id,
      comments_counter: 0,
      likes_counter: 0
    )
  end

  it 'like_counter should increase by one' do
    Like.create(user_id: @user.id, post_id: @post.id)
    post = Post.find(@post.id)
    expect(post.likes_counter).to_not eq(nil)
  end
end
