class Task < ApplicationRecord
  acts_as_taggable_on :tags
  belongs_to :user
  include AASM
  
  validates :title, presence: true, length: { maximum: 60 }
  validates :content, presence: true, length: { maximum: 300 }
  validates :deadline, :priority, presence: true

  # default_scope { order(created_at: :desc) }
  scope :recent, -> { order(created_at: :desc) }

  scope :title_like, ->(title) { where("title like ?", "#{title}%") }
  # scope :status_like, ->(status) { where("status like ?", "#{status}%") }

  #   scope :ordered_by_created_at, -> { order(created_at: :desc) }

  #   scope :ordered_by_created_at, -> { reorder(created_at: :desc) }
  #   scope :ordered_by_created_at, -> { order(created_at: :asc).unscope(:order) }

  aasm column: :status do
    state :notstarted, initial: true
    state :inprogress
    state :stoped
    state :done

    event :start do
      transitions from: [:notstarted], to: :inprogress
    end
    event :stop do
      transitions from: [:inprogress], to: :stoped
    end
    event :restart do
      transitions from: [:stoped], to: :inprogress
    end
    event :done do
      transitions from: [:inprogress], to: :done
    end
  end
  enum priority: [:low, :medium, :high]
  paginates_per 3
end
