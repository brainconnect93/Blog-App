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
end
    