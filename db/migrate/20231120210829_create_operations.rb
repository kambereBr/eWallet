class CreateOperations < ActiveRecord::Migration[7.1]
  def change
    create_table :operations do |t|
      t.references :author, null: false, foreign_key: { to_table: :users, column: :authorId }
      t.string :name
      t.decimal :amount
      t.references :group, null: false, foreign_key: true
      t.string :operation_code

      t.timestamps
    end
  end
end
