require 'rails_helper'

RSpec.describe User, type: :feature do
    describe 'Index page' do
        before(:each) do
            visit users_path
            @users = User.all
        end

        it 'should show the name of all users' do
            @users.each do |user|
                expect(page).to have_content(user.Name)
            end
        end
        it 'should show the pictures of all users' do
            @users.each do |user|
                expect(page).to have_css("img[src*='#{user.Photo}']")
            end
        end
        it 'should show number of posts of each users' do
            @users.each do |user|
                expect(page).to have_content(user.PostsCounter)
            end
        end
        it 'should redirect to a user\'s show page when click on user' do
            @users.each do |user|
                click_link(user.Name)
                expect(page).to have_current_path(user_path(user))
            end
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
            Post.create(
                id: rand(1000),
                user: @user,
                title: 'My testing',
                text: 'This is my testing post',
                comments_counter: 0,
                likes_counter: 0
            )
            @user = User.all
            visit user_path(@user.first)
        end

        it 'should show user\'s picture' do
            expect(page).to have_css("img[src*='#{@user.first.Photo}']")
        end

        it 'should show user\'s name' do
            expect(page).to have_content(@user.first.Name)
        end
    end
end
