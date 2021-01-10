class CreateListColumns < ActiveRecord::Migration[6.0]
  def change
    create_table :list_columns do |t|
      t.string :title
      t.text :description
      t.integer :sort_order
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
