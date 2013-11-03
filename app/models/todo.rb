class Todo < ActiveRecord::Base
  default_scope { order(:created_at) }

  validates :title, presence: true
  scope :active, -> { where(completed: false) }
  scope :completed, -> { where(completed: true) }

  def title=(title)
    write_attribute(:title, title.try(:strip))
  end

  ##
  # Class methods

  def self.toggle_all
    active.any? ? active.update_all(completed: true) : update_all(completed: false)
  end

  def self.clear_completed
    completed.destroy_all
  end
end
