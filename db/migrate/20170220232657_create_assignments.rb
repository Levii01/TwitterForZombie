class CreateAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :assignments do |t|
      t.references :zombie, foreign_key: true, index: true
      t.references :role, foreign_key: true, index: true

      t.timestamps
    end
  end
end
