class TripLog < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :miles, presence: true, numericality: { only_float: true }
  belongs_to :user

  def carbon_saved
    ((self.miles * 404.0) / 1000).round(3)
  end
end
