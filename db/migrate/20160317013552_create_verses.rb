class CreateVerses < ActiveRecord::Migration
  def change
    create_table :verses do |t|
      t.text :slug
      t.text :book
      t.text :chapter
      t.text :verse

      t.timestamps null: false
    end
  end
end
