class Task < ApplicationRecord
  has_and_belongs_to_many :workers
  belongs_to :project
  enum status: [:Assigned, :InProgress, :Finish]
  validates_presence_of :deadline, :description, :status, :project
  before_save :check_worker_role

  def self.search_by_parms(worker_id, status)
    begin
      if worker_id.present?
        worker = Worker.find(worker_id)
        status.present? ? worker.tasks.where(:status => status) : worker.tasks
      elsif  status.present?
        Task.where(:status => status)
      else
        Task.all
      end
    rescue => e
      raise StandardError.new "#{e}"
    end
  end

  def check_worker_role
    self.workers.each{ |w|  raise StandardError.new "Worker #{w.name} isn't a DEV" if w.role != "DEV" }
  end
end
