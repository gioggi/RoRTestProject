class Commit < ApplicationRecord
  belongs_to :task
  belongs_to :worker
  enum :type => [:Message, :Note]
  validates_presence_of :note, :worker_id, :type, :task_id
end
