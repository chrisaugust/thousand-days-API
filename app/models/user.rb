class User < ApplicationRecord
  has_secure_password
  has_many :progress_entries, dependent: :destroy
  has_many :commitments, dependent: :destroy
end
