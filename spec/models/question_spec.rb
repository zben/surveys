require 'rails_helper'

describe Question, type: :model do
  describe 'associations and validations' do
    it { should belong_to(:user) }
    it { should have_many(:responses) }
    it { should validate_presence_of(:content) }
  end
end
