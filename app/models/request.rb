class Request < ApplicationRecord
  # one request have many duration
  has_many :durations, dependent: :destroy, inverse_of: :request
  # one request belong to one user
  belongs_to :user

  # -- review relationship -- one request have many reviewers
  has_many :permissions
  has_many :reviewers, :through => :permissions, :source => :user

  # -- cc relationship -- one request have many cc_users
  has_many :ccs
  has_many :cc_users, :through => :ccs, :source => :user

  accepts_nested_attributes_for :durations, allow_destroy: true

  def total_duration
    self.durations.inject(0) { |sum, duration| sum + duration.total_duration}
  end
end
