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
            @post_1 = Post.create(
                id: rand(1000),
                user: @user,
                title: 'My testing',
                text: 'This is my testing post',
                comments_counter: 0,
                likes_counter: 0
            )
            Comment.create(user: @user, post: @post_1, text: 'My first comment')
            @user = User.all
            visit user_posts_path(@user.ids)
        end

        it 'should show user profile picture' do
            expect(page).to have_css("img")
        end
        
        it 'should show the current user\'s name' do
            expect(page).to have_content(@user.first.Name)
        end

        it 'should show the number of posts the user has written' do
            expect(page).to have_content(@user.first.PostsCounter)
        end

        it 'shouldIt shows the posts text' do
            expect(page).to have_content(@post_1.text)
        end
    end
end
