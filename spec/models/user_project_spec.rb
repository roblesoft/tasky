# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a valid factory' do
    expect(create(:user_project)).to be_valid
  end

  let(:user_project) { build(:user_project) }

  describe 'ActiveRecord associations' do
    it { expect(user_project).to belong_to(:project) }
    it { expect(user_project).to belong_to(:user) }
  end
end
