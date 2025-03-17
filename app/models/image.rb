class Image < ApplicationRecord
  has_many :progress_entries, dependent: :destroy
  has_many :commitments
end
