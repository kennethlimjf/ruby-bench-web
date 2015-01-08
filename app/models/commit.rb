class Commit < ActiveRecord::Base
  extend CommitReviewer

  belongs_to :repo
  has_many :benchmark_runs, as: :initiator, dependent: :destroy

  validates :sha1, presence: true, length: { minimum: 5 }, uniqueness: { scope: :repo_id }
  # TODO: Add validation of URL
  validates :url, presence: true
  validates :repo_id, presence: true
  validates :message, presence: true
end
