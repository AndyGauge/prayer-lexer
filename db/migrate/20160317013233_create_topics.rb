class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.text :slug

      t.timestamps null: false
    end
  end
end
