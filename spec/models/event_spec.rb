require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:project) { build(:project) }
  let(:saved_project) { create(:project) }

  context 'Project lifecycle' do
    describe 'Project creation' do
      it 'create' do
        project.save
        expect(project.events.size).to eql(1)
      end
      it 'event name ' do
        project.save
        expect(project.events.first.name).to eql('create')
      end
    end

    describe 'Update project' do
      it 'update event' do
        saved_project.save
        saved_project.update_columns title: 'Tasky2'
        expect(saved_project.events.size).to eql(2)
      end
      it 'event name ' do
        saved_project.save
        expect(saved_project.events.last.name).to eql('update')
      end
    end

    describe 'Destroy project' do
      it 'destroy event' do
        saved_project.update_columns title: 'Tasky2'
        saved_project.destroy
        expect(Event.all.size).to eql(0)
      end
    end
  end
end
