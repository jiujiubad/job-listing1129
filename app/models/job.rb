class Job < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :wage_upper, numericality:{greater_than: 0}, presence: true
  validates :wage_lower, numericality: { greater_than: 0 }, presence: true

  scope :recent, -> {order("updated_at DESC")}

  def hide!
    self.is_hidden = true
    self.save
  end

  def publish!
    self.is_hidden = false
    self.save
  end
end
