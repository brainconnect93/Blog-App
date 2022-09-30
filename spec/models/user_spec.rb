require 'rails_helper'

RSpec.describe User, type: :model do
    before(:all) do
        @user = User.new(
            Name: 'Afolabi',
            Photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
            Bio: 'I am a graphic designer',
            PostsCounter: 2
        )
    end

    it '@user as created should be valid' do
        expect(@user).to be_valid
    end

    it 'name value sholud be present' do
        @user.Name = nil
        expect(@user).to_not be_valid
    end

    it 'PostsCounter should have a numeric value' do
        @user.PostsCounter = 'two'
        expect(@user).to_not be_valid
    end

    it 'PostCounter must be an integer >= zero' do
        @user.PostsCounter = -2
        expect(@user).to_not be_valid
    end

    it 'returns photo if valid' do
        @user.Photo = 'https://unsplash.com/photos/F_-0BxGuVvo'
        expect(@user).to be_valid
    end
    
    it 'is valid with a bio' do
        @user.Bio = 'I am a graphic designer'
        expect(@user).to be_valid
    end
end