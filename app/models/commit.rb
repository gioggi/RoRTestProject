class Commit < ApplicationRecord
  belongs_to :task
  belongs_to :worker
  enum :kind => [:Message, :Note]
  validates_presence_of :note, :worker_id, :kind, :task_id
end
