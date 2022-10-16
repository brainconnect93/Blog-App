require 'rails_helper'

RSpec.describe 'Authentication', type: :request do
  describe 'POST /login' do
    before(:each) do
      @user1 = User.create(
        Name: 'Afolabi',
        Bio: 'Software Developer',
        Photo: 'https://res.cloudinary.com/afolabi/image/upload/v1593640000/afolabi.jpg',
        PostsCounter: 2
      )
    end

    it 'authenticates a user' do
      post '/api/v1/authenticate', params: { Name: @user1.Name, password: 'password' }
      expect(response).to have_http_status(:created)
      expect(response.body).to include({ 'token' => 'token' })
    end
  end
end
