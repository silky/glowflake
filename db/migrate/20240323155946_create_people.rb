# frozen_string_literal: true

class CreatePeople < ActiveRecord::Migration[7.1]
  def change
    create_table :people do |t|
      t.string :name, null: false
      t.string :image, null: false
      t.string :email, null: false

      t.timestamps
    end
    # Users can't ever have the same emails
    add_index :people, :email, unique: true
  end
end
