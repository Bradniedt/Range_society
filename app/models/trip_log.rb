class TripLog < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :miles, presence: true, numericality: { only_float: true }
  belongs_to :user
end
