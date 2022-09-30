require 'rails_helper'

RSpec.describe Like, type: :model do
  context 'Association between the tables' do
    it { should belongs_to(:user) }
    it { should belongs_to(:post) }
  end
end