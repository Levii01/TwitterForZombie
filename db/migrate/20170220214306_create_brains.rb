class CreateBrains < ActiveRecord::Migration[5.0]
  def change
    create_table :brains do |t|
      t.belongs_to :zombie, foreign_key: true, index: true
      t.string :status
      t.string :flavor

      t.timestamps
    end
  end
end
