class Project < ApplicationRecord
  has_many :tasks
  belongs_to :worker
  validates_presence_of :worker, :name
  before_save :check_worker_role

  def project_manager_name
    worker.name if worker
  end

  def check_worker_role
    raise StandardError.new "Worker isn't a PM" if worker.role != "PM"
  end
end
