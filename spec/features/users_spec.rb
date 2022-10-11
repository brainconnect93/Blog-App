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
    end 
end
