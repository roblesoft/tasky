class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.references :list_column, null: false, foreign_key: true
      t.id :user
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
