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
    end
end