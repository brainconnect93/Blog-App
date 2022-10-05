require 'rails_helper';

describe PostsController, type: :request do
    describe "GET '/index' page" do
        before(:all) do
            @link = get '/users/:id/posts';
            get '/users/:id/posts';
        end

        it 'returns a 200 status code' do
            expect(@link).to eq(200)
        end

        it 'renders the index template' do
            expect( get '/users/:id/posts').to render_template('posts/index')
        end

        it 'loads the posts to includes correct placeholder text' do
            expect(response.body).to include('I come in peace')
        end
    end
end