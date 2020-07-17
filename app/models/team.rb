class Team < ApplicationRecord
  has_many :workers
  validates_presence_of :name
  before_save :check_worker_role

  def check_worker_role
    self.workers.each{ |w|  raise StandardError.new "Worker #{w.name} is a CEO" if w.CEO? }
  end
end
