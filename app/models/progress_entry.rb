class ProgressEntry < ApplicationRecord
  belongs_to :commitment

  def user
    commitment.user
  end
end
