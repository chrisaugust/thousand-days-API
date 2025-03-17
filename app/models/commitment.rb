class Commitment < ApplicationRecord
  belongs_to :user
  belongs_to :image

  has_many :progress_entries, dependent: :destroy

  validates :name, presence: true
  validates :timeframe, numericality: { only_integer: true, greater_than: 0 }
end
