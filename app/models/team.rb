class Team < ApplicationRecord
  has_many :workers
  validates_presence_of :name
end
