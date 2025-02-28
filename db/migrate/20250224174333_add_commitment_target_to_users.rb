class AddCommitmentTargetToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :commitment_target, :string
  end
end
