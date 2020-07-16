class Badge < ApplicationRecord
  belongs_to :worker
  has_many :stamps
  validates_presence_of :worker
end
