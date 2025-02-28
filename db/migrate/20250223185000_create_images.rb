class CreateImages < ActiveRecord::Migration[7.1]
  def change
    create_table :images do |t|
      t.string :name, null: false
      t.string :url, null: false
      t.integer :num_regions, null: false
      t.jsonb :metadata, default: {}, null: false

      t.timestamps
    end

    add_index :images, :url, unique: true
  end
end
