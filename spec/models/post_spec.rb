require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:all) do
    @user = User.create(
      Name: 'Akorede',
      Photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      Bio: 'Am a software developer',
      PostsCounter: 2
    )
    @post = Post.create(
      title: 'Harry Potter',
      text: 'the sorcerers stone',
      author_id: @user.id,
      comments_counter: 4,
      likes_counter: 4
    )
  end

  it 'post should return valid as created' do
    expect(@post).to_not be_valid
  end

  it 'post title should be present' do
    @post.title = 'nil'
    expect(@post).to_not be_valid
  end

  it 'post text should not be too short' do
    @post.text = 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula
        eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient
        montes'
    expect(@post).to_not be_valid
  end

  it 'post comments_counter should be numeric' do
    @post.comments_counter = 'one'
    expect(@post).to_not be_valid
  end

  it 'post likes_comment should be numeric >= 0' do
    @post.likes_counter = 'one'
    expect(@post).to_not be_valid
  end
end
