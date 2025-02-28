class User < ApplicationRecord
  has_secure_password
  has_many :progress_entries, dependent: :destroy
  validates :commitment_target, presence: true
end
