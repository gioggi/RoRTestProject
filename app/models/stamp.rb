class Stamp < ApplicationRecord
  belongs_to :badge
  validates_presence_of :start_at
end
