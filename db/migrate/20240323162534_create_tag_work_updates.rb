# frozen_string_literal: true

class CreateTagWorkUpdates < ActiveRecord::Migration[7.1]
  def change
    create_table :tag_work_updates do |t|
      t.references :tag, null: false, foreign_key: true
      t.references :work_update, null: false, foreign_key: true

      t.timestamps
    end
    # Each update can only have a specific tag once
    add_index :tag_work_updates, %i[tag_id work_update_id], unique: true
  end
end
