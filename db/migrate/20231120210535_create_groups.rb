class CreateGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :icon
      t.references :author, null: false, foreign_key: { to_table: :users, column: :authorId }

      t.timestamps
    end
  end
end
