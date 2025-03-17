class UpdateProgressEntriesAddCommitmentIdAndRemoveUserId < ActiveRecord::Migration[7.1]
  def change
    remove_column :progress_entries, :user_id, :integer
    add_reference :progress_entries, :commitment, null: false, foreign_key: true
  end
end
