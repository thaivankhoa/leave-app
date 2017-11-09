class Request < ApplicationRecord
  # one request have many duration
  has_many :durations, dependent: :destroy, inverse_of: :request
  # one request belong to one user
  belongs_to :user

  # -- review relationship -- one request have many reviewers
  has_many :permissions
  has_many :reviewers, :through => :permissions, :source => :user

  accepts_nested_attributes_for :durations, allow_destroy: true
end
