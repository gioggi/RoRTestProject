class Worker < ApplicationRecord
  has_one :badge
  has_one :project
  belongs_to :team, :optional => true
  has_and_belongs_to_many :tasks
  enum :role => [:DEV, :PM, :CEO]
  validates_presence_of :name, :email, :role
  validates :team, presence: {unless: :ceo?}
  before_create :create_badge

  def ceo?
    role == 'CEO'
  end

  def team_name
    team.name if team
  end

  def create_badge
    self.badge = Badge.new(:released_at => DateTime.now) unless badge.present?
  end

end
