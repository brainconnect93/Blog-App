require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'Associations between the tables' do
    it { should belongs_to(:user) }
    it { should belongs_to(:post) }
  end
end