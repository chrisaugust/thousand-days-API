class RemoveCommitmentTargetFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :commitment_target, :string
  end
end
