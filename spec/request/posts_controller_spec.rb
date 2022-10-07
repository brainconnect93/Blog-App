require 'rails_helper'

describe PostsController, type: :request do
  describe "GET '/index' page" do
    before :each do
      @link = get '/users/1/posts'
      get '/users/1/posts'
    end

    it 'returns a 200 status code' do
      expect(@link).to eq(200)
    end

    it 'renders the index template' do
      expect(get('/users/1/posts')).to render_template('posts/index')
    end

    it 'loads the posts to includes correct placeholder text' do
      expect(response.body).to include('The User Post')
    end
  end

  describe "GET '/show' page" do
    before :each do
      @link = get '/users/1/posts/1'
      get '/users/1/posts/1'
    end

    it 'returns a 200 status code' do
      expect(@link).to eq(200)
    end

    it 'renders the show template' do
      expect(get('/users/1/posts/1')).to render_template('posts/show')
    end

    it 'loads the posts to includes correct placeholder text' do
      expect(response.body).to include('Single Post by a user')
    end
  end
end
