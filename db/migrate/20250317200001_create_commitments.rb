class CreateCommitments < ActiveRecord::Migration[7.1]
  def change
    create_table :commitments do |t|
      t.string :name
      t.text :description
      t.integer :timeframe
      t.references :user, null: false, foreign_key: true
      t.references :image, null: false, foreign_key: true

      t.timestamps
    end
  end
end
