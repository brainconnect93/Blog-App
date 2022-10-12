require 'rails_helper'

RSpec.describe Post, type: :feature do
  describe 'Index page' do
    before(:each) do
      @user = User.create(
        Name: 'Tom',
        Photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
        Bio: 'Teacher from Mexico.',
        PostsCounter: 0
      )
      @post1 = Post.create(
        id: rand(1000),
        user: @user,
        title: 'Hello',
        text: 'This is my first post',
        comments_counter: 0,
        likes_counter: 0
      )
      Comment.create(user: @user, post: @post1, text: 'Afolabi is still learning')
      @user = User.all
      visit user_posts_path(@user.ids)
    end

    it 'should show user profile picture' do
      expect(page).to have_css('img')
    end

    it 'should show the current user\'s name' do
      expect(page).to have_content(@user.first.Name)
    end

    it 'should show the number of posts the user has written' do
      expect(page).to have_content(@user.first.PostsCounter)
    end

    it 'shouldIt shows the posts text' do
      expect(page).to have_content(@post1.text)
    end

    it 'should show the number of comments a post has' do
      expect(page).to have_content(@post1.comments_counter)
    end

    it 'should show the number of likes a post has' do
      expect(page).to have_content(@post1.likes_counter)
    end
  end

  describe 'Show page' do
    before(:each) do
      @user = User.create(
        Name: 'Tom',
        Photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
        Bio: 'Teacher from Mexico.',
        PostsCounter: 0
      )
      @post1 = Post.create(
        id: rand(1000),
        user: @user,
        title: 'Hello',
        text: 'This is my first post',
        comments_counter: 0,
        likes_counter: 0
      )
      Comment.create(user: @user, post: @post1, text: 'Afolabi is still learning')
      @user = User.all
      visit user_post_path(@user.ids, @post1.id)
    end

    it 'should show the post title' do
      expect(page).to have_content(@post1.title)
    end

    it 'should show the user\'s name' do
      expect(page).to have_content(@post1.user.Name)
    end

    it 'should show the number of comments a post has' do
      expect(page).to have_content(@post1.comments_counter)
    end

    it 'should show the number of likes a post has' do
      expect(page).to have_content(@post1.likes_counter)
    end

    it 'should show the post body' do
      expect(page).to have_content(@post1.text)
    end

    it 'should show the username of the commentators' do
      comments = @post1.comments
      comments.each do |comment|
        expect(page).to have_content(comment.user.Name)
      end
    end

    it 'should show the text of the comments' do
      comments = @post1.comments
      comments.each do |comment|
        expect(page).to have_content(comment.text)
      end
    end
  end
end
