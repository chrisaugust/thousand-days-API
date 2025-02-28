class Image < ApplicationRecord
  has_many :progress_entries, dependent: :destroy
end
