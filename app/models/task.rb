class Task < ApplicationRecord
  validates :title, presence: true, length: { maximum: 60 }
  validates :content, presence: true, length: { maximum: 150 }
  validates :deadline, presence: true

  default_scope { order(created_at: :desc) }

  #   scope :ordered_by_created_at, -> { order(created_at: :desc) }

  #   scope :ordered_by_created_at, -> { reorder(created_at: :desc) }
  #   scope :ordered_by_created_at, -> { order(created_at: :asc).unscope(:order) }
end
