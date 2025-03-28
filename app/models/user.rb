class User < ApplicationRecord
  has_secure_password
  has_many :commitments, dependent: :destroy
  has_many :progress_entries, through: :commitments 
end
