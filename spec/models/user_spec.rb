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

  it 'name value should be present' do
    @user.Name = nil
    expect(@user).to_not be_valid
  end

  it 'PostsCounter should have a numeric value' do
    @user.PostsCounter = nil
    expect(@user).to_not be_valid
  end

  it 'PostCounter must be an integer >= 0' do
    @user.PostsCounter = -2
    expect(@user).to_not be_valid
  end

  it 'is valid with a bio' do
    @user.Bio = 'nil'
    expect(@user).to_not be_valid
  end
end
