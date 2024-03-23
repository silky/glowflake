# frozen_string_literal: true

class CreateWorkUpdates < ActiveRecord::Migration[7.1]
  def change
    create_table :work_updates do |t|
      t.references :person, null: false, foreign_key: true
      t.string :content, null: false

      t.timestamps
    end
  end
end
