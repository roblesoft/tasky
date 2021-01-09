require 'rails_helper'

RSpec.describe ListColumn, type: :model do
  it 'has a valid factory' do
    expect(create(:list_column)).to be_valid
  end

  let(:list_column) { build(:list_column) }

  describe 'ActiveRecord associations' do
    it { expect(list_column).to belong_to(:project) }
    it { expect(list_column).to have_many(:tasks) }
  end
end
