class Request < ApplicationRecord
  # one request have many duration
  has_many :durations, dependent: :destroy, inverse_of: :request
  # one request belong to one user
  belongs_to :user

  accepts_nested_attributes_for :durations, allow_destroy: true
end
