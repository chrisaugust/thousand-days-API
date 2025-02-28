class CreateProgressEntries < ActiveRecord::Migration[7.1]
  def change
    create_table :progress_entries do |t|
      t.references :user, null: false, foreign_key: true
      t.references :image, null: false, foreign_key: true
      t.integer :day, null: false
      t.integer :region_id, null: false
      t.string :color, null: false

      t.timestamps
    end

    add_index :progress_entries, [:user_id, :day, :region_id], unique: true
  end
end
