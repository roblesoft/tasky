# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Task, type: :model do
  it 'has a valid factory' do
    expect(create(:task)).to be_valid
  end

  let(:task) { build(:task) }

  describe 'ActiveRecord associations' do
    it { expect(task).to belong_to(:list_column) }
    it { expect(task).to belong_to(:user) }
  end
end
