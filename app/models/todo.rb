class Todo < ActiveRecord::Base
  validates :title, presence: true
  default_scope { order(:created_at) }
  scope :active, -> { where(completed: false) }
  scope :completed, -> { where(completed: true) }

  def self.toggle_all
    if active.any?
      active.update_all(completed: true)
    else
      update_all(completed: false)
    end
  end

  def self.clear_completed
    completed.destroy_all
  end
end
