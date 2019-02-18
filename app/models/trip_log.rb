class TripLog < ApplicationRecord
  verifies_presence_of :title, :miles
end
