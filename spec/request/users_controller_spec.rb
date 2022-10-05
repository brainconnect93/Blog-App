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
    end
end
    