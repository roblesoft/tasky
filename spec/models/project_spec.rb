# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Project, type: :model do
  it 'has a valid factory' do
    expect(create(:project)).to be_valid
  end

  let(:project) { build(:project) }

  describe 'ActiveRecord associations' do
    it { expect(project).to have_many(:list_columns) }
    it { expect(project).to have_many(:user_projects) }
  end
end
