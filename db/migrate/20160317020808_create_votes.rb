class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :tally
      t.references :verse, index: true, foreign_key: true
      t.references :topic, index: true, foreign_key: true
      t.references :verse_end, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
