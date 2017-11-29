class Job < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :wage_upper, numericality:{greater_than: 0}, presence: true
  validates :wage_lower, numericality: { greater_than: 0 }, presence: true

end
