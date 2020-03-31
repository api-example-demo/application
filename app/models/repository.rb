class Repository < ApplicationRecord
  belongs_to :project
  after_create :run_job_creation
  after_initialize :defaults, unless: :persisted?

  validates_uniqueness_of :name, scope: :project_id

  auto_strip_attributes :name

  enum status: [ :pending, :failed, :success ]

  def run_job_creation
    JobJenkinsCreatorJob.perform_later self.id
  end

  def defaults
    self.status = :pending
  end
end
