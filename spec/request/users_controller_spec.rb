require 'rails_helper';

RSpec.describe 'UsersController', type: :request do
    describe "GET './index' page" do
        before(:all) do
            @link = get '/users';
            get '/users';
        end

        it 'returns a 200 status code' do
            expect(@link).to eq(200)
        end

        it 'renders the index template' do
            expect( get '/users').to render_template('users/index')
        end
        
        it 'loads the users to includes correct placeholder text' do
            expect(response.body).to include('My favourite players blog')
        end
    end

    describe "GET '/show' page" do
        before(:all) do
            @link = get '/users/show';
            get '/users/show';
        end

        it 'returns a 200 status code' do
            expect(@link).to eq(200)
        end
        
        it 'renders the show template' do
            expect( get '/users/show').to render_template('users/show')
        end
        
        it 'loads the user to includes correct placeholder text' do
            expect(response.body).to include('Here is a list of posts for a given user')
        end
    end
end
    