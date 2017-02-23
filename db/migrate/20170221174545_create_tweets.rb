class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|
      t.string :status
      t.belongs_to :zombie, foreign_key: true

      t.timestamps
    end
  end
end
