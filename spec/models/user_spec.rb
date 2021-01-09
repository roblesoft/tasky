# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a valid factory' do
    expect(create(:user)).to be_valid
  end

  let(:user) { build(:user) }

  describe 'ActiveModel validations' do
    it { expect(user).to validate_uniqueness_of(:email) }
  end

  describe 'ActiveRecord associations' do
    it { expect(user).to have_many(:tasks) }
    it { expect(user).to have_many(:user_projects) }
  end
end
