class Task < ApplicationRecord
  has_and_belongs_to_many :workers
  belongs_to :project
  has_many :commits
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

  def self.search_cross_tasks
    tasks = []
    Task.all.each{|task| tasks << task if task.workers.group_by(&:team_id).count >= 2}
    tasks
  end

  def self.search_expired_tasks
    Task.all.where('deadline < ? ', DateTime.now)
  end

  def check_worker_role
    self.workers.each{ |w|  raise StandardError.new "Worker #{w.name} isn't a DEV" if !w.DEV? }
  end
end
