class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.references :project, null: false, foreign_key: true
      t.references :eventable, polymorphic: true, null: false
      t.string :name

      t.timestamps
    end
  end
end
